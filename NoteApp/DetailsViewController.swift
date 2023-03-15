//
//  DetailsViewController.swift
//  NoteApp
//
//  Created by Ümit Şimşek on 15.03.2023.
//

import UIKit
import CoreData
class DetailsViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    var choosenTitle = ""
    var choosenDescription = ""
    var isSelected = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        if isSelected {
            titleTextField.text = choosenTitle
            descriptionTextField.text = choosenDescription
            saveButton.isHidden = isSelected
        }
        isSelected = false
    }
    @IBAction func saveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context)
        newNote.setValue(titleTextField.text, forKey: "title")
        newNote.setValue(descriptionTextField.text, forKey: "desc")
        newNote.setValue(UUID(), forKey: "id")
        
        do{
            try context.save()
            print("success")
            titleTextField.text = ""
            descriptionTextField.text = "Description"
            performSegue(withIdentifier: "toVC", sender: nil)

        }catch {
            print("error")
        }
    }
    

}
