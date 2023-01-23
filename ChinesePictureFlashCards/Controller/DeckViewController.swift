//
//  DeckViewController.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/18.
//

import UIKit
import CoreData
import OSLog
import AVFoundation
import Speech

class DeckViewController: UIViewController, AVAudioRecorderDelegate {
    
    //MARK: - Properties
    private var audioPlayer:AVAudioPlayer!
    var words:[NSManagedObject]!
    var dataManager:NSManagedObjectContext!
    var page = 0
    var deckName = ""
    private var defaultLog = Logger()
    private var chineseWordCheck = ""
    var confidenceScores = [Float()]
    
    
    //MARK: - Outlets
    @IBOutlet weak var chineseLabel: UILabel!
    @IBOutlet weak var pronunciationLabel: UILabel!
    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var decksButton: UIBarButtonItem!
    //@IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Create Labels
        defaultLog.debug("Selected deck: \(self.deckName)")
        navigationBar.topItem?.title = self.deckName.capitalized
        decksButton.tintColor = UIColor.white
        decksButton.isEnabled = false
        if self.page == 0 {
            decksButton.tintColor = UIColor.black
            decksButton.isEnabled = true
        }
       
        
        //Playback button
        let audio = words[page].value(forKey: "audio") as? String
        loadAudio(name: audio!)
       
        
        //Request transcribe permisstions
        if !SpeechRecognizer.permissions() {
            DispatchQueue.main.async {
                let controller = UIAlertController()
                controller.title = "SFSpeech Recognizer"
                controller.message = "Permissions for SF Speech recognizer not granted."
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
                }
                controller.addAction(okAction)
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //resize for small dispays
        if picture.frame.height < 350.0 {
            let margins = view.layoutMarginsGuide
            picture.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 50).isActive = true
        }
        
        //set label text
        chineseLabel.text = words[page].value(forKey: "chinese") as? String
        chineseLabel.textColor = .black
        chineseWordCheck = chineseLabel.text!
        pronunciationLabel.text = words[page].value(forKey: "pronunciation") as? String
        englishLabel.text = words[page].value(forKey: "english") as? String
        let pictureName = words[page].value(forKey: "picture") as? String
        picture.image = UIImage(named: pictureName!)
        
        //show or hide labels
        let showChinese = UserDefaults.standard.bool(forKey: "showChineseLanguage")
        if showChinese {
            chineseLabel.isHidden = false
        } else {
            chineseLabel.isHidden = true
        }
        let showEnglish = UserDefaults.standard.bool(forKey: "showEnglishLanguage")
        if showEnglish {
            englishLabel.isHidden = false
        } else {
            englishLabel.isHidden = true
        }
        
        let showPronunciation = UserDefaults.standard.bool(forKey: "showPinyin")
        if showPronunciation {
            pronunciationLabel.isHidden = false
        } else {
            pronunciationLabel.isHidden = true
        }
       
        let showPicture = UserDefaults.standard.bool(forKey: "showPicture")
        if showPicture {
            picture.isHidden = false
        } else {
            picture.isHidden = true
        }
    }
    
    //MARK: - Functions
    func loadAudio(name: String) {
        guard let audioFilePath = Bundle.main.path(forResource: name, ofType: "mp3") else {
            return
        }
        let audioFileURL = URL.init(fileURLWithPath: audioFilePath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL, fileTypeHint: nil)
        } catch {
            defaultLog.debug("AVAudio Player Error = \(error.localizedDescription)")
        }
    }
    
    func colorFeedback(word:String, score:Float) -> NSAttributedString {
        var textColor = UIColor()
        let green = UIColor.init(red: 0.0/255, green: 102.0/255, blue: 15.0/255, alpha: 1.0) //dark green
        let yellow = UIColor.init(red: 204.0/255, green: 204.0/255, blue: 0.0/255, alpha: 1.0) //yellow
        
        switch score {
        case 80.0...100:
            textColor = green
            break
          
        case 60.0...80:
            textColor = yellow
            break
           
        case ...60:
            textColor = UIColor.red
            break

        default:
            break
        }
        
        let attributes:[NSAttributedString.Key:Any] = [NSAttributedString.Key.foregroundColor:textColor]
        let coloredFeedback = NSAttributedString(string: word, attributes: attributes)
        return coloredFeedback
    }
    
    //MARK: - Actions
    
    @IBAction func upSwipped(_ sender: UISwipeGestureRecognizer) {
        if page == (words.count - 1) {
        } else {
            let controller = storyboard?.instantiateViewController(withIdentifier: "deckViewController") as! DeckViewController
            controller.words = self.words
            controller.deckName = self.deckName
            controller.page = self.page + 1
            controller.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            present(controller, animated: true, completion: nil)
        }
    }
        
    @IBAction func downSwipped(_ sender: UISwipeGestureRecognizer) {
        if page == 0 {
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        defaultLog.debug("Play button tapped.")
        audioPlayer.enableRate = true
        audioPlayer.rate = 0.8
        audioPlayer.play()
    }
    
    @IBAction func recordButtonTapped(_ sender: UIButton) {
        
        //check for availability of speech recognizer
        self.confidenceScores.removeAll()
        if !SpeechRecognizer.isAvailable() {
                let controller = UIAlertController()
                controller.title = "Network Error"
                controller.message = "SFSpeechReconizer is not available.  We can not do assessments at this time."
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
                }
                controller.addAction(okAction)
                self.present(controller, animated: true, completion: nil)
                return
            }
        
       
        do {
            try SpeechRecognizer.accessSpeech(text: chineseWordCheck, completion: { result, error in
                
                //transcription flag
                var transcriptionFound = false
                
                //text for display
                var coloredFeedback = NSAttributedString()
                for transcription in result!.transcriptions {
                    self.defaultLog.debug("Transcription found: \(transcription.formattedString)")
                    if self.chineseLabel.text!.trimmingCharacters(in: CharacterSet(charactersIn: " ")) == transcription.formattedString {
                        transcriptionFound = true
                        self.defaultLog.debug("Match found: \(self.chineseLabel.text!) and \(transcription.formattedString)")
                        for segment in transcription.segments {
                            self.defaultLog.info("Segment: \(segment.substring) Confidence: \(segment.confidence*100) %")
                            self.confidenceScores.append(segment.confidence*100)
                            self.defaultLog.debug("segment substring: \(segment.substring) confidenceScores: \(self.confidenceScores)")
                            coloredFeedback =  self.colorFeedback(word: segment.substring, score:self.confidenceScores.max()!)
                        } //end for
                        DispatchQueue.main.async {
                            self.chineseLabel.attributedText =  coloredFeedback
                        }
                    }
                } //end for transcription in result
                
                if !transcriptionFound  {
                    DispatchQueue.main.async {
                        self.chineseLabel.textColor = .red
                    }
                } //end if transrptionFound
            })
        } catch {
            print(error.localizedDescription)
            let controller = UIAlertController()
            controller.title = "SFSpeech Recognizer"
            controller.message = "Failed to recognize audio."
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            }
            controller.addAction(okAction)
            self.present(controller, animated: true, completion: nil)
        }
    }

    @IBAction func decksButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
