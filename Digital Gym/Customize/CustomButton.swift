//
//  OutlinedButton.swift
//  Iceburg
//
//  Created by Aidan Curtis on 12/1/17.
//  Copyright © 2017 southpawac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomizeButton: UIButton{

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

