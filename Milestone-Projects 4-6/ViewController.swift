//
//  ViewController.swift
//  Milestone-Projects 4-6
//
//  Created by othman shahrouri on 8/15/21.
//

import UIKit

class ViewController: UITableViewController {
    var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping list"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash ,target: self, action: #selector(emptyItems))
        
        
        navigationController?.isToolbarHidden = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    @objc func addItem(){
        let ac = UIAlertController(title: "Add Item", message: "Add item to your shopping list", preferredStyle: .alert)
        ac.addTextField()
        let addingAction = UIAlertAction(title: "Add", style: .default) { [weak self] action in
            guard let itemToAdd = ac.textFields?[0].text else {return}
            self?.items.insert(itemToAdd, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
            
        }
        
        ac.addAction(addingAction)
        present(ac, animated: true)
     
    }
    
    
    
    @objc func emptyItems(){
        items.removeAll()
        tableView.reloadData()
    }

}

