//
//  ViewController.swift
//  UngServiceTurbo
//
//  Created by MasterUNG on 21/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }   // Main Method
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        let user: String = userTextField.text!
        let password: String = passwordTextField.text!
        
        if (user.count == 0) || (password.count == 0) {
//            Have Space
            myAlert(title: "Have Space", message: "Please Fill All Blank")
        } else {
//            No Space
            checkAuthen(user: user, password: password)
        }
        
    }   // loginButton
    
    func myAlert(title: String, message: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func checkAuthen(user: String, password: String) -> Void {
        
        let myConstant = MyConstant()
        let urlString: String = myConstant.getURLgetUserWhereUser(user: user)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let dataResponse = data else {
                print("Have Error")
                return
            }
            
            do {
                
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray[0])
                for jsonDictionary in jsonArray {
                    guard let truePassword: String = jsonDictionary["Password"] as? String else {
                        return
                    }
                    if password == truePassword {
                        print("Authen True")
                    } else {
                        print("Password False")
                    }
                }   // for
                
                
            } catch let myError {
                
                DispatchQueue.main.async {
                    self.myAlert(title: "User False", message: "No \(user) in my Database")
                }
                
                print("myError==>\(myError)")
            }
            
            
        } // end Task
        task.resume()
        
        
        
        
        
    }

}   // Main Class

