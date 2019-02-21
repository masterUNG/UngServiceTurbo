//
//  RegisterViewController.swift
//  UngServiceTurbo
//
//  Created by MasterUNG on 21/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }   // Method Main
    
    @IBAction func uploadButton(_ sender: UIBarButtonItem) {
        
        let name: String = nameTextField.text!
        let user: String = userTextField.text!
        let password: String = passwordTextField.text!
        
        print("name ==> \(name),  user ==> \(user), password ==> \(password)")
        if (name.count == 0) || (user.count == 0) || (password.count == 0){
//            Have Space
            registerAlert(title: "Have Space", message: "Please Fill All Blank")
        } else {
//            No Space
            
        }   // if
    }   //uploadButton
    
    func registerAlert(title: String, message: String) -> Void {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
        
        
    }


}   // Main Class
