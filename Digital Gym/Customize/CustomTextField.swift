//
//  CustomTextField.swift
//  DigitalGym
//
//  Created by Aidan Curtis on 3/17/18.
//  Copyright © 2018 southpawac. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomTextField: UITextField{
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor?{
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    
    @IBInspectable var placeholderColor: UIColor {
        get {
            guard let currentAttributedPlaceholderColor = attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { return UIColor.clear }
            return currentAttributedPlaceholderColor
        }
        set {
            guard let currentAttributedString = attributedPlaceholder else { return }
            let attributes = [NSAttributedStringKey.foregroundColor : newValue]
            
            attributedPlaceholder = NSAttributedString(string: currentAttributedString.string, attributes: attributes)
        }
    }
    
    
}
