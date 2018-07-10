//
//  RegPage.swift
//  DigitalGym
//
//  Created by Aidan Curtis on 2/2/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit

class RegPage: UIViewController, UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        
        //create user
        let rest = RestClient()
        let _ = rest.register(email: emailInput.text!, password: passwordInput.text!, name: nameInput.text!).done { (user) in
            if(user.success)!{
                global_user = user
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                self.alert(message: user.message!)
            }
        }
    }
    @IBOutlet weak var emailInput: CustomTextField!
    
    @IBOutlet weak var nameInput: CustomTextField!
    
    @IBOutlet weak var passwordInput: CustomTextField!
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
    
}
