//
//  ViewController.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: "IsLoggedIn") == true {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
            self.navigationController?.pushViewController(vc, animated: false)
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
