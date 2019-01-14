//
//  LoginViewController.swift
//  oneCourse1
//
//  Created by MEHTAB SINGH GILL on 09/01/19.
//  Copyright © 2019 MEHTAB SINGH GILL. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField1: UITextField!
    
    @IBOutlet weak var PasswordTextField1: UITextField!
    let loginToList =  "LoginToDepTSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Auth.auth().addStateDidChangeListener() { auth, user in
//            if user != nil {
//                self.performSegue(withIdentifier: self.loginToList, sender: nil)
//                self.EmailTextField.text = nil
//                self.PasswordTextField.text = nil
//            }
//        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginButtonTapped(_ sender: Any) {
        guard
            let email = EmailTextField1.text,
            let password = PasswordTextField1.text,
            email.count > 0,
            password.count > 0
            else {
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                let alert = UIAlertController(title: "Sign In Failed",
                                              message: error.localizedDescription,
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                
                self.present(alert, animated: true, completion: nil)
            }
            self.performSegue(withIdentifier: self.loginToList, sender: nil)
        }
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
                if error == nil {
                    Auth.auth().signIn(withEmail: self.EmailTextField1.text!,
                                       password: self.PasswordTextField1.text!)
                }
            }
        }
        
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .cancel)
        
            alert.addTextField { textEmail in
                textEmail.placeholder = "Enter your email"
            }
        
            alert.addTextField { textPassword in
                textPassword.isSecureTextEntry = true
                textPassword.placeholder = "Enter your password"
            }
        
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
        
            present(alert, animated: true, completion: nil)
        }
    
    }

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == EmailTextField1 {
            PasswordTextField1.becomeFirstResponder()
        }
        if textField == PasswordTextField1 {
            textField.resignFirstResponder()
        }
        return true
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


