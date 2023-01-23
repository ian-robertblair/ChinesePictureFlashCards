//
//  DeckListViewController.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/18.
//

import UIKit
import CoreData
import OSLog

class DeckListViewController: UIViewController {
    //MARK: - Properties
    var dataManager:NSManagedObjectContext!
    var selectedDeck:NSManagedObject!
    private var defaultLog = Logger()
    private var fResultsController = NSFetchedResultsController<NSManagedObject>()
    
    
    //MARK: - Outlets
    @IBOutlet weak var deckListTable: UITableView!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.dataController.viewContext
        deckListTable.dataSource = self
        deckListTable.delegate = self
        self.deckListTable.separatorStyle =
        UITableViewCell.SeparatorStyle.none
        self.deckListTable.rowHeight = 90.0
    
        initializeDatabase()
        
        //Set up UserDefaults
        if UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
            defaultLog.debug("defaults set already.")
        } else {
            UserDefaults.standard.set(true, forKey: "showChineseLanguage")
            UserDefaults.standard.set(true, forKey: "showEnglishLanguage")
            UserDefaults.standard.set(true, forKey: "showPinyin")
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            UserDefaults.standard.set(true, forKey: "showPicture")
            defaultLog.debug("Defaults set.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //FetchResultsController
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Deck")
        fetch.sortDescriptors = [NSSortDescriptor(key: "deckType", ascending: true), NSSortDescriptor(key: "name", ascending: true)]
        self.fResultsController = NSFetchedResultsController(fetchRequest: fetch, managedObjectContext: dataManager, sectionNameKeyPath: "deckType", cacheName: "Master")
        fResultsController.delegate = self
        do {
            try fResultsController.performFetch()
        } catch {
            fatalError("Unable to perform fetch")
        }
    }
    
    //MARK: - Functions
    fileprivate func initializeDatabase() {
        //Delete decks
        let fetchRequest: NSFetchRequest<Deck> = Deck.fetchRequest()
        var result = [NSManagedObject]()
        fetchRequest.predicate = NSPredicate(format: "deckType == %@", "default")
        do {
            result = try dataManager.fetch(fetchRequest)
            for eachDeck in result {
                dataManager.delete(eachDeck)
            }
            try dataManager.save()
        } catch {
            defaultLog.debug("Failed to delete decks from database.  \(error.localizedDescription)")
        }
        
      
        //Add decks
        let  defaultDecks = DefaultData.someData()
        for deck in defaultDecks! {
            
            let newEntry = NSEntityDescription.insertNewObject(forEntityName: "Deck", into: self.dataManager)
            newEntry.setValue(deck.name, forKey: "name")
            newEntry.setValue("default", forKey: "deckType")
            
            do {
                try self.dataManager.save()
                //self.defaultLog.debug("Deck saved.")
            }catch {
                self.defaultLog.debug("Failed to save deck.")
            }
            
            for word in deck.words {
                
                let newWord = NSEntityDescription.insertNewObject(forEntityName: "Word", into: self.dataManager)
                
                newWord.setValue(word.englishWord, forKey: "english")
                newWord.setValue(newEntry, forKey: "deck")
            
                newWord.setValue(word.chineseWord, forKey: "chinese")
                newWord.setValue(word.pronunciation, forKey: "pronunciation")
                newWord.setValue(word.audio + ".jpg", forKey: "picture")
                newWord.setValue(word.audio, forKey: "audio")
            }
          
            
            do {
                try self.dataManager.save()
                //self.defaultLog.info("Words saved.")
            }catch {
                self.defaultLog.debug("Failed to save words.")
            }
          
        } //end deck for
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "deckViewSegue" {
            let controller = segue.destination as! DeckViewController
            controller.dataManager = self.dataManager
            let words = selectedDeck.value(forKey: "words") as? NSSet
            let deck = selectedDeck.value(forKey: "name") as! String
            controller.deckName = deck
            controller.words = words?.allObjects as? [NSManagedObject]
        }
       
        if segue.identifier == "addDeckSegue" {
            let controller = segue.destination as! AddDeckViewController
            controller.dataManager = self.dataManager
        }
       
        if segue.identifier == "editDeckSegue" {
            let controller = segue.destination as! EditDeckViewController
            controller.deck = self.selectedDeck
            controller.dataManager = self.dataManager
        }
        
    }

    //MARK: - Actions
    
}

//MARK: - Extension

extension DeckListViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        deckListTable.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            deckListTable.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            deckListTable.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .move: break
        case .update: break
        @unknown default:
            fatalError("How?")
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let nip = newIndexPath else { fatalError("How?") }
            deckListTable.insertRows(at: [nip], with: .fade)
        case .delete:
            guard let ip = indexPath else { fatalError("How?") }
            deckListTable.deleteRows(at: [ip], with: .fade)
            //deckListTable.reloadRows(at: [ip], with: .fade)
        case .move:
            guard let ip = indexPath else { fatalError("How?") }
            guard let nip = newIndexPath else { fatalError("How?") }
            deckListTable.insertRows(at: [nip], with: .fade)
            deckListTable.reloadRows(at: [ip], with: .fade)
        case .update:
            guard let ip = indexPath else { fatalError("How?") }
            deckListTable.reloadRows(at: [ip], with: .fade)
        @unknown default:
            fatalError("How?")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        deckListTable.endUpdates()
    }
}

extension DeckListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        guard let sectionInfo = self.fResultsController.sections?[section] else {
            fatalError("failed to resolve FRC")
        }
        return sectionInfo.numberOfObjects
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let count = self.fResultsController.sections?.count else {
            fatalError("failed to resolve FRC")
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
               header.textLabel?.textColor = .white
           }
    }
    
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.fResultsController.sections?[section].name
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = self.fResultsController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "deckListCell") as! DeckListTableViewCell
        
        cell.view.layer.cornerRadius = 8
        cell.view.layer.masksToBounds = true
        let name = obj.value(forKey: "name") as? String
        cell.deckName.text = name?.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = self.fResultsController.object(at: indexPath)
        let name = obj.value(forKey: "name") as? String
        let fetchRequest: NSFetchRequest<Deck> = Deck.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name!)
            do {
                let result = try dataManager.fetch(fetchRequest)
                self.selectedDeck = result[0]
            } catch {
                self.defaultLog.debug("Failed to retrieve selected deck.  \(error.localizedDescription)")
            }
        
        //count the number of words greater than before segue
        let words = self.selectedDeck.value(forKey: "words") as! NSSet
        if words.count == 0 {
            DispatchQueue.main.async {
                let controller = UIAlertController()
                controller.title = "Empy Deck"
                controller.message = "Please edit the the deck and add at least one word."
                let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
                }
                controller.addAction(okAction)
                self.present(controller, animated: true, completion: nil)
            }
        } else {
            performSegue(withIdentifier: "deckViewSegue", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.section == 0 {
            
            let editAction = UITableViewRowAction(style: UITableViewRowAction.Style.normal, title: "Edit") { action, indexPath in
                let obj = self.fResultsController.object(at: indexPath)
                self.selectedDeck = obj
                self.performSegue(withIdentifier: "editDeckSegue", sender: self)
            }
            let deleteAction = UITableViewRowAction(style: UITableViewRowAction.Style.normal, title: "Delete") { action, indexPath in
                let deckToDelete = self.fResultsController.object(at: indexPath)
                self.dataManager.delete(deckToDelete)
                do {
                    try self.dataManager.save()
                } catch {
                    self.defaultLog.debug("\(error.localizedDescription)")
                }
            }
            return [deleteAction, editAction]
        } else {
            return nil
        }
    }
}
