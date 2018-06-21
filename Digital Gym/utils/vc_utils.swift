//
//  vc_utils.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
