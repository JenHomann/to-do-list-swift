//
//  SecondViewController.swift
//  to-do-list
//
//  Created by Jen Homann on 12/5/17.
//  Copyright © 2017 Jen Homann. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var warningLabel: UILabel!
    
    @IBAction func addButton(_ sender: Any) {
        let newTodo = todoTextField.text
        let currentTodos = UserDefaults.standard.object(forKey: "todos")
        var todos: [String]
        
        if newTodo != nil && newTodo != "", let todo = newTodo {
            if let tempTodos = currentTodos as? [String] {
                todos = tempTodos
                todos.append(todo)
            } else {
                todos = [newTodo!]
            }
            
            UserDefaults.standard.set(todos, forKey: "todos")
            updateLabel("\(todo) added to list.", withColor: UIColor.black)
        } else {
            updateLabel("You must enter a valid todo item.", withColor: UIColor.red)
        }
        
        todoTextField.text = ""
    }
    
    func updateLabel(_ labelString: String, withColor color: UIColor) {
        warningLabel.text = labelString
        warningLabel.textColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        warningLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        todoTextField.resignFirstResponder()
        return true
    }


}
