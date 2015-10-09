//
//  ViewRecursion.swift
//  Swift_iOS-Localize-Constraint
//
//  Created by binaryboy on 10/9/15.
//  Copyright (c) 2015 AhmedHamdy. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    func allSubViews() ->[UIView]
    {
        var arr:[UIView] = [UIView]()
        
        arr.append(self)
        
        for  subview: UIView in self.subviews as! [UIView]
        {
            arr.extend(subview.allSubViews())
        }
        
        return arr;
    }
    
}