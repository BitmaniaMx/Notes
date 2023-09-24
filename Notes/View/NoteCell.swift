//
//  NoteCell.swift
//  Notes
//
//  Created by Rafael Gonzalez on 24/09/23.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteTitle: UILabel!
    
    @IBOutlet weak var noteDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
