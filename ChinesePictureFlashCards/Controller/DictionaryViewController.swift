//
//  DictionaryViewController.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/2/5.
//

import UIKit
import OSLog

class DictionaryViewController: UIViewController {

    //MARK: - Properties
    
    //MARK: - Outlets
    @IBOutlet weak var dictionaryLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    let defaultLog = Logger()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - Actions
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        let term = searchTextField.text?.lowercased()
        
        var ponsURL = URLComponents()
        ponsURL.scheme = "https"
        ponsURL.host = "api.pons.com"
        ponsURL.path = "/v1/dictionary"
        ponsURL.queryItems = [
            URLQueryItem(name: "q", value: term),
            URLQueryItem(name: "l", value: "enzh"), //Dictionary
            URLQueryItem(name: "language", value: "zh"),
            URLQueryItem(name: "in", value: "en")
        ]
        
        PonsClient.search(url: ponsURL.url!, term: term!) { error, dictionaryResponse in
            if error != nil {
                DispatchQueue.main.async {
                    let controller = UIAlertController()
                    controller.title = "Dictionary Error"
                    controller.message = error!.localizedDescription
                    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
                    }
                    controller.addAction(okAction)
                    self.present(controller, animated: true, completion: nil)
                }
                self.defaultLog.debug("PONS Search Error:  \(error!.localizedDescription)")
                return
            }
            
            var dictionaryText = ""
            for eachResponse in dictionaryResponse! {
                dictionaryText = dictionaryText + eachResponse + "\n"
            }
            
            DispatchQueue.main.async {
                self.dictionaryLabel.text = "\(dictionaryText)"
            }
            
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        searchTextField.text = ""
    }
}
