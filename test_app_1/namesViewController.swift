//
//  namesViewController.swift
//  test_app_1
//
//  Created by Bthloo on 22/09/2024.
//

import UIKit

class namesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        validationLabel.text = ""
        namesTableView.dataSource = self
        namesTableView.delegate = self
        
        if namesList.isEmpty{
            namesTableView.isHidden = true
        }
        
    }
    
    
    var namesList = [String]()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var namesTableView: UITableView!
    
    
    @IBOutlet weak var validationLabel: UILabel!
    
    
    @IBAction func editBtn(_ sender: Any) {
        namesTableView.isEditing = !namesTableView.isEditing
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        
        if let name = nameTextField.text , !name.isEmpty{
            validationLabel.text = ""
            namesList.append(name)
            let indexPath = IndexPath(row: namesList.count - 1, section: 0)
            namesTableView.beginUpdates()
            namesTableView.insertRows(at: [indexPath], with: .automatic)
            namesTableView.endUpdates()
            namesTableView.isHidden = false
            nameTextField.text = ""
        }else{
    
            validationLabel.text = "please enter a valid name"
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.textLabel?.text = namesList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        namesList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
  
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandeler )in
            self.namesList.remove(at: indexPath.row)
            self.namesTableView.beginUpdates()
            self.namesTableView.deleteRows(at: [indexPath], with: .automatic)
            self.namesTableView.endUpdates()
            
            if self.namesList.isEmpty{
                self.namesTableView.isHidden = true
            }
            
            completionHandeler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    

}
