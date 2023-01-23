//
//  EditDeckViewController.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/1/18.
//

import UIKit
import CoreData
import OSLog

class EditDeckViewController: UIViewController {
    //MARK: - Properties
    let defaultLog = Logger()
    var deck:NSManagedObject!
    private var fResultsController = NSFetchedResultsController<NSManagedObject>()
    var dataManager:NSManagedObjectContext!
    
    //MARK: - Outlets
    
    @IBOutlet weak var deckTable: UITableView!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        deckTable.dataSource = self
        deckTable.delegate = self
        let deckName = self.deck.value(forKey: "name")!
        navigationBar.title = "Edit \(deckName)"
        deckTable.rowHeight = 140.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Word")
        fetch.predicate = NSPredicate(format: "deck == %@", self.deck)
        let sortDescriptor = NSSortDescriptor(key: "english", ascending: true)
        fetch.sortDescriptors = [sortDescriptor]
        
        self.fResultsController = NSFetchedResultsController(fetchRequest: fetch, managedObjectContext: self.dataManager, sectionNameKeyPath: nil, cacheName: "Master")
        fResultsController.delegate = self
        do {
            try fResultsController.performFetch()
        } catch {
            fatalError("Unable to perform fetch")
        }
    }
//MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addWordSegue" {
            let controller = segue.destination as! AddWordViewController
            controller.deck = self.deck
            controller.dataManager = self.dataManager
            
        }
    }
    

//MARK: - Actions
    @IBAction func decksButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let words = self.deck.value(forKey: "words") as! NSSet
        print("Count of words: ", words.count)
        if words.count == 8 {
            let controller = UIAlertController()
            controller.title = "Maximum Exceeded"
            controller.message = "Decks have a limit of eight words.  Please delete a word if you want to add another."
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { action in
            }
            controller.addAction(okAction)
            self.present(controller, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "addWordSegue", sender: self)
        }
    }
}



//MARK: - Extensions

extension EditDeckViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let sectionInfo = self.fResultsController.sections?[section] else {
            fatalError("Failed to resolve FRC")
        }
        print("number of objects: ", sectionInfo.numberOfObjects)
        return sectionInfo.numberOfObjects
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let count = self.fResultsController.sections?.count else {
            fatalError("failed to resolve FRC")
        }
        print("sections \(count)")
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = self.fResultsController.object(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "editDeckTableViewCell") as! EditDeckTableViewCell
            
        cell.englishWordLabel.text = obj.value(forKey: "english") as? String
        cell.chineseWordLabel.text = obj.value(forKey: "chinese") as? String
        cell.pronunciationLabel.text = obj.value(forKey: "pronunciation") as? String
        cell.picture.image = UIImage(named: (obj.value(forKey: "picture") as? String)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowAction.Style.normal, title: "Delete") { action, indexPath in
            let deckToDelete = self.fResultsController.object(at: indexPath)
            self.dataManager.delete(deckToDelete)
            do {
                try self.dataManager.save()
            } catch {
                print(error)
            }
        }
        return [deleteAction]
    }
}

extension EditDeckViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        deckTable.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            deckTable.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        case .delete:
            deckTable.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
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
            deckTable.insertRows(at: [nip], with: .fade)
        case .delete:
            guard let ip = indexPath else { fatalError("How?") }
            deckTable.deleteRows(at: [ip], with: .fade)
            //deckTable.reloadRows(at: [ip], with: .fade)
        case .move:
            guard let ip = indexPath else { fatalError("How?") }
            guard let nip = newIndexPath else { fatalError("How?") }
            deckTable.insertRows(at: [nip], with: .fade)
            deckTable.reloadRows(at: [ip], with: .fade)
        case .update:
            guard let ip = indexPath else { fatalError("How?") }
            deckTable.reloadRows(at: [ip], with: .fade)
        @unknown default:
            fatalError("How?")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        deckTable.endUpdates()
    }
}
