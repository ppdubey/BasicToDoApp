//
//  TableViewCell.swift
//  ToDoApp
//
//  Created by priya pai  on 08/06/22.
//

import Foundation
import UIKit
 

protocol valueChangedDelegate : AnyObject {
    func itemChecked(_ checkedCell: TableViewCell, isChecked: Bool)
}

class TableViewCell : UITableViewCell {

    @IBOutlet weak var chkBox: Checkbox!
    @IBOutlet weak var labelCell: UILabel!
    
    weak var delegate : valueChangedDelegate?

    @IBAction func valueChanged(_ sender: Checkbox) {
        print("Value Changed : \(sender.checked)")

        delegate?.itemChecked(self, isChecked: sender.checked)
    }
    
    
}
