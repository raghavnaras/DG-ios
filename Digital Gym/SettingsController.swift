//
//  SettingsController.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit


class SettingsController: UIViewController{
    
    @IBAction func LogOut(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "IsLoggedIn")
    }
    
    @IBAction func deleteAccount(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "IsLoggedIn")
        
    }
    
    
}


