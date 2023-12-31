//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Rafael Gonzalez on 22/09/23.
//

import UIKit

class NotesTableViewController: UITableViewController {
    

    let noteManager = NoteManager()
    
    @IBOutlet var tableViewNotes: UITableView!
    @IBOutlet var emptyNotesView: UIView!
    var note : Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if noteManager.countNotes() == 0 {
            emptyNotesView.isHidden = false
            tableViewNotes.backgroundView = emptyNotesView
        }
        else{
            emptyNotesView.isHidden = true
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteManager.countNotes()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        cell.noteTitle.text = noteManager.getNote(at: indexPath.row).title
        cell.noteDate.text = noteManager.getNote(at: indexPath.row).date.iso8601String
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete ...
            print("Delete...")
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func unWindFromAddNoteViewController(segue: UIStoryboardSegue){
        print("Unwind segue!")
        let source = segue.source as! AddNoteViewController
        note = source.newNote
        noteManager.createNote(note: note!)
        print("#",noteManager.countNotes())
        print("notes:",noteManager.getNotes())
        noteManager.saveNotes()
        tableViewNotes.reloadData()
        
    }
    
    

}
