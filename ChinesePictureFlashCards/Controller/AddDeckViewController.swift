//
//  AddDeckViewController.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/18.
//

import UIKit
import OSLog
import CoreData

class AddDeckViewController: UIViewController {

    //MARK: - Properties
    let defaultLog = Logger()
    var dataManager:NSManagedObjectContext!
    
    //MARK: - Outlets
    @IBOutlet weak var deckNameTextField: UITextField!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func addButtonTapped(_ sender: UIButton) {
        var deckExist = false
        let name = deckNameTextField.text!
        
        //check for existing name
        let fetchRequest: NSFetchRequest<Deck> = Deck.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        var result = [NSManagedObject]()
        do {
            result = try dataManager.fetch(fetchRequest)
            print("Number of results: ", result.count)
            if result.count > 0 {
                deckExist = true
            }
        } catch {
            defaultLog.debug("Failed to delete decks from database.  \(error.localizedDescription)")
        }
    
        //Add name
        if deckExist {
            DispatchQueue.main.async {
                let controller = UIAlertController()
                controller.title = "Database Error"
                controller.message = "A deck with the name \(name) already exists.  Please choose another name."
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
                }
                controller.addAction(okAction)
                self.present(controller, animated: true, completion: nil)
            }
        } else {
            let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Deck", into: self.dataManager)
            
            newEntity.setValue(name, forKey: "name")
            newEntity.setValue("custom", forKey: "deckType")
            do {
                try self.dataManager.save()
            } catch {
                defaultLog.debug("Failed to add: \(name)")
            }
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
