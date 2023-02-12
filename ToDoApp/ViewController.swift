//
//  ViewController.swift
//  ToDoApp
//
//  Created by priya pai  on 08/06/22.
//

// chage #2 in b4
// chage #4 in b1
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var listTable: UITableView!
    
    var closure : (() ->()) = { print("closure called")}
    
    //    var itemList = ["veggies", "pickup", "coaching"]
    var itemList = [toDoItem(itemName: "veggies", itemChecked: false),
                    toDoItem(itemName: "pickup", itemChecked: false),
                    toDoItem(itemName: "coaching", itemChecked: false)
                   ]

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(itemList)
        test()
        self.listTable.dataSource = self
        self.listTable.delegate = self
    }
    
    
    @IBAction func addItem(_ btn: UIButton) {
        print(" Add button pressed ")
        
        alertWithTextInput(with: "New Item", message: "Enter new Item", actionButtonTitle: "OK", cancelButtonTitle: "CANCEL", placeholderString: "Enter here", completion: {
            itemString in
                self.itemList.append(toDoItem(itemName: itemString, itemChecked: false))
                self.listTable.reloadData()
        })
    }

    @IBAction func editItem(_ btn: UIButton) {
        print(" Edit button pressed")
    }
    
    
}

