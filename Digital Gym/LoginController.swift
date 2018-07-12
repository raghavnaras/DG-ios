//
//  LoginController.swift
//  DigitalGym
//
//  Created by Aidan Curtis on 3/16/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit

class LoginController:UIViewController, UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginPressed(_ sender: Any) { //this is an action so that if the loginbutton is pressed the code below happens
        let rest = RestClient()
        let _ = rest.login(email: emailInput.text!, password: passwordInput.text!).done { (user) in
            if(user.success)!{
                UserDefaults.standard.set(true, forKey: "IsLoggedIn")
                global_user = user
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
                
            else{
                self.alert(message: user.message!)
            }
        }
        
    }
    
    @IBOutlet weak var emailInput: CustomTextField!
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("data")
    @IBOutlet weak var passwordInput: CustomTextField!
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
 
}

