//
//  NoteManager.swift
//  Notes
//
//  Created by Rafael Gonzalez on 22/09/23.
//

import Foundation

class NoteManager{
    
    private var notes : [Note] = []
    
    init() {
        loadNotes()
    }
    
    func createNote(note : Note){
        notes.append(note)
    }
    
    func deleteNote(at index : Int ){
        notes.remove(at: index)
    }
    
    func countNotes() -> Int {
        return notes.count
    }
    
    func getNote(at index : Int) -> Note {
        return notes[index]
    }
    
    func getNotes() -> [Note]{
        return notes
    }
    
    func loadNotes(){
        //load notes from filesystem
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let notesPath = documentDirectory.appendingPathComponent("notes.json")
        
        //Check if file exists
        if fileManager.fileExists(atPath: notesPath.path){
            do{
                let jsonData = fileManager.contents(atPath: notesPath.path)
                notes = try JSONDecoder().decode([Note].self, from: jsonData!)
            }
            catch let error {
                print("error:", error)
            }
        }
        else{
            print("MSG: Files does not exits")
        }
    }
    
    func saveNotes(){
        //saves notes to fileSystem
        
        //set directory for save json file
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let notesPath = documentDirectory.appendingPathComponent("notes.json")
        
        //add note to json file
        do{
            let jsonData = try JSONEncoder().encode(notes)
            fileManager.createFile(atPath: notesPath.path, contents: jsonData)
        }catch let error {
            print(error)
        }
    }

    //MARK: Homework
    func updateNote(note : Note, at index : Int){
        //Update a note at specific index
    }    
}
