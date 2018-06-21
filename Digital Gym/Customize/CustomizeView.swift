//
//  CustomizeView.swift
//  Digital Gym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomView: UIView{
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor?{
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    
}
