//
//  LiveData.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//
import Foundation
import UIKit
import Alamofire
import SwiftCharts

class LiveDataController: UIViewController{
    
    @IBOutlet weak var LiveDataOutput: UILabel!
    var ChartView: Chart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.LiveDataOutput.text = "No live data found. Start biking to see live data."
        
        let rest = LiveDataRestClient()
        
        if (Hardware.machineID == nil) {
            self.LiveDataOutput.text="Scan QR code to view live data"
        }
        
        else {
        
        _ = rest.getCurrentRpm(machineID: Hardware.machineID!).done { (hardware) in
            
            let chartConfig = BarsChartConfig(valsAxisConfig: ChartAxisConfig(from: 0, to: 10, by: 1))
            
            let frame = CGRect(x: 0, y: 270, width: self.view.frame.width, height: 450)
            
            let chart = BarsChart(
                frame: frame,
                chartConfig: chartConfig,
                xTitle: "Time",
                yTitle: "RPM",
                bars: [
                    ("12:54", Double(hardware.rpm!))
                ],
                color: UIColor.white,
                barWidth:15
            )
            
            self.view.addSubview(chart.view)
            self.ChartView = chart
            
         
            if(hardware.success)! {
                global_hardware = hardware
                self.LiveDataOutput.text = "Live data found. Scan QR code to view"
                self.alert(message: hardware.message!)
            }
            else {
                print("hi")
                print(hardware.rpm!)
                //self.alert(message: hardware.message!)
            }
    }
            
        }
}
    @IBAction func HomePressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
//
//if(user.success)!{
//    global_user = user
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "TabBarController")
//    self.navigationController?.pushViewController(vc, animated: true)
//}else{
//    self.alert(message: user.message!)
//}
