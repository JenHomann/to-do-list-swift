//
//  FirstViewController.swift
//  to-do-list
//
//  Created by Jen Homann on 12/5/17.
//  Copyright © 2017 Jen Homann. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet var todoListTable: UITableView!
    var todos: [String] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "todoCell")
        
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentTodos = UserDefaults.standard.object(forKey: "todos")
        
        if let tempTodos = currentTodos as? [String] {
            todos = tempTodos
        }
        todoListTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

