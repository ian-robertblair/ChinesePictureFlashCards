//
//  AddWordViewController.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/18.
//

import UIKit
import CoreData
import OSLog

class AddWordViewController: UIViewController {

    //MARK: - Properties
    let defaultLog = Logger()
    var deck:NSManagedObject!
    var dataManager:NSManagedObjectContext!
    var allWords = [NSManagedObject]()
    
    //MARK: - Outlets
    @IBOutlet weak var wordPicker: UIPickerView!
    //@IBOutlet weak var cancelButton: UIButton!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        wordPicker.delegate = self
        wordPicker.dataSource = self
        let title = deck.value(forKey: "name") as! String
        print("Default Deck: ", title)
        let words = deck.value(forKey: "words") as! NSSet
        print("number of words: ", words.count)
        
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "deck.deckType == %@", "default")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "english", ascending: true)]
        do {
            self.allWords = try self.dataManager.fetch(fetchRequest)
        } catch {
            defaultLog.debug("fetch request failed")
        }
        
        print("Count of all words: ", self.allWords.count)
    }
    
    //MARK: - Actions
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let words = deck.value(forKey: "words") as! NSSet
        if words.count < 8 {
            //add word to deck, change cancel to done
            let wordNumber = self.wordPicker.selectedRow(inComponent: 0)
            let selectedWord = allWords[wordNumber]
            print("Selected from the picker: ", selectedWord.value(forKey:"english") as! String, selectedWord.value(forKey:"chinese") as! String)
            let newEntry = NSEntityDescription.insertNewObject(forEntityName: "Word", into: self.dataManager)
            newEntry.setValue(selectedWord.value(forKey:"english"), forKey: "english")
            newEntry.setValue(selectedWord.value(forKey:"chinese"), forKey: "chinese")
            newEntry.setValue(selectedWord.value(forKey:"pronunciation"), forKey: "pronunciation")
            newEntry.setValue(selectedWord.value(forKey:"picture"), forKey: "picture")
            newEntry.setValue(selectedWord.value(forKey:"audio"), forKey: "audio")
            newEntry.setValue(self.deck, forKey: "deck")
            do {
                try self.dataManager.save()
                self.defaultLog.debug("Word saved to deck.")
            }catch {
                self.defaultLog.debug("Failed to save deck.")
            }
        } else {
            //Add alert that deck already has 8 words
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Extension
extension AddWordViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("pickter count of all words: ", self.allWords.count)
        return self.allWords.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let title = allWords[row].value(forKey: "english") as! String
        return title
    }

}
