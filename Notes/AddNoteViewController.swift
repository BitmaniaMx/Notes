//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Rafael Gonzalez on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var noteTitle: UITextView!
  
    @IBOutlet weak var noteContent: UITextView!
    var newNote : Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        newNote = Note(title: noteTitle.text, content: noteContent.text!, date: Date())
        //Add validation Homework
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
        
    }
    
    //Add validation Homework
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    
    

}
