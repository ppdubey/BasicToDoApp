//
//  DetailsViewController.swift
//  ToDoApp
//
//  Created by priya pai  on 13/06/22.
//
//some change for b1
//change #2 in b1
//change #3 in b1


import UIKit

class DetailsViewController: UIViewController {

    var data = toDoItem(itemName: "", itemChecked: false)
    var closure: ((String)-> ())?
//    var data1 : toDoItem {
//        get {
//            return self.data
//         }
//        set {
//            let new = toDoItem(itemName: newValue.itemName, itemChecked: newValue.itemChecked)
//            data.itemName = new.itemName
//            data.itemChecked = new.itemChecked
//
//        }
//    }

    @IBOutlet weak var titlelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Details View load :data.itemName = \(data.itemName)")
        
        closure?(data.itemName)
        guard titlelabel != nil else {

            dismiss(animated: true)
            return}
        titlelabel.text = data.itemName
    }
    
}
