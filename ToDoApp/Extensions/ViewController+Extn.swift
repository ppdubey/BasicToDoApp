//
//  ViewController+Extn.swift
//  ToDoApp
//
//  Created by priya pai  on 08/06/22.
//
// chage #4 in b1
import Foundation
import UIKit

extension ViewController {
    
    func attributeStringlabel(attributeString: Bool, textString: String) ->  NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: textString)
        
        if attributeString {
            attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
        } else {
            attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-1))
        }
        
        return attributedString
    }
    
    func alertWithTextInput(with title: String,
                            message: String,
                            actionButtonTitle: String,
                            cancelButtonTitle: String,
                            placeholderString: String,
                            completion: @escaping (String)-> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addTextField { textFld in
            textFld.placeholder = placeholderString
        }
        
        let actionButton = UIAlertAction(title: actionButtonTitle, style: .default) { action in
            completion(alertController.textFields?[0].text ?? "")
        }
        
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        
        alertController.addAction(actionButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true, completion: nil)
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func test(){
        var arr = [1,2,3]
        print(arr.reduce(0, {
            print($0)
            print($1)
            return $0 + $1}))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! TableViewCell
        cell.delegate = self
        //        cell.textLabel?.text = itemList[indexPath.row]
        let checked = itemList[indexPath.row].itemChecked
        let text = itemList[indexPath.row].itemName
        
        //cell.labelCell.text = text
        cell.chkBox.checked = checked
        
        cell.labelCell.attributedText = attributeStringlabel(attributeString: checked, textString: text)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(" tableView DS editingStyle : \(editingStyle)")
        let index = indexPath.row
        if editingStyle == .delete {
            itemList.remove(at: index)
        }
        self.listTable.reloadData()
    }
}

extension ViewController : valueChangedDelegate {
    
    func itemChecked(_ checkedCell: TableViewCell, isChecked: Bool) {
        guard let index = self.listTable.indexPath(for: checkedCell) else { return }
        
        let item = toDoItem(itemName: itemList[index.row].itemName, itemChecked: isChecked)
        itemList[index.row] = item
        self.listTable.reloadData()
        
    }
}

extension ViewController : UITableViewDelegate {

    

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        print("Tableview delegate : ")
         return .delete
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" Did select row at : \(indexPath.row)")
        
        let vc = storyboard?.instantiateViewController(identifier: "detailsVC", creator: nil) as! DetailsViewController
        
//        let vc = DetailsViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.data = itemList[indexPath.row]
        
        vc.closure = { text in
            print("Text received from closuer:  \(text)")
            
        }
            
        
        //presents a new VC on the current VC; no BACK
        //present(vc, animated: true, completion: nil)
        
        //Presents/PUSH a new VC as part of current Navigation VC
        // creats BACK to navigate to previous VC
        navigationController?.pushViewController(vc, animated: true)
    }
}
