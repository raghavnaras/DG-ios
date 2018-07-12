//
//  HistoryController.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class HistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //setting up table view organization
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell")!
        return cell
    }
    
    
}


