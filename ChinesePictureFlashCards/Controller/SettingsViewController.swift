//
//  SettingsViewController.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/18.
//

import UIKit
import OSLog

class SettingsViewController: UIViewController {

    @IBOutlet weak var chineseWordSwitch: UISwitch!
    @IBOutlet weak var englishWordSwitch: UISwitch!
    @IBOutlet weak var pronunciationSwitch: UISwitch!
    @IBOutlet weak var picture: UISwitch!
    let defaultLog = Logger()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if UserDefaults.standard.bool(forKey: "showChineseLanguage") {
            chineseWordSwitch.setOn(true, animated: true)
        } else {
            chineseWordSwitch.setOn(false, animated: true)
        }
        
        if UserDefaults.standard.bool(forKey: "showEnglishLanguage") {
            englishWordSwitch.setOn(true, animated: true)
        } else {
            englishWordSwitch.setOn(false, animated: true)
        }
        
        if UserDefaults.standard.bool(forKey: "showPinyin") {
            pronunciationSwitch.setOn(true, animated: true)
        } else {
            pronunciationSwitch.setOn(false, animated: true)
        }
        
        if UserDefaults.standard.bool(forKey: "showPicture") {
            picture.setOn(true, animated: true)
        } else {
            picture.setOn(false, animated: true)
        }
        
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        
        if chineseWordSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "showChineseLanguage")
            defaultLog.debug("chinese word on")
        } else {
            UserDefaults.standard.set(false, forKey: "showChineseLanguage")
            defaultLog.debug("Chinese word off")
        }
        
        if englishWordSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "showEnglishLanguage")
            defaultLog.debug("english word on")
        } else {
            UserDefaults.standard.set(false, forKey: "showEnglishLanguage")
            defaultLog.debug("english word off")
        }
        
        if pronunciationSwitch.isOn {
            UserDefaults.standard.set(true, forKey: "showPinyin")
            defaultLog.debug("pinyin is on")
        } else {
            UserDefaults.standard.set(false, forKey: "showPinyin")
            defaultLog.debug("pinyin is off")
        }
        
        if picture.isOn {
            UserDefaults.standard.set(true, forKey: "showPicture")
            defaultLog.debug("picture is on")
        } else {
            UserDefaults.standard.set(false, forKey: "showPicture")
            defaultLog.debug("pinyin is off")
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
