//
//  LocalizeConstrint.swift
//  Swift_iOS-Localize-Constraint
//
//  Created by binaryboy on 10/9/15.
//  Copyright (c) 2015 AhmedHamdy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func changeViewRTL(tempView:UIView){
        
        var constraintsToAdd: [NSLayoutConstraint] = [NSLayoutConstraint]()
        var constraintsToRemove: [NSLayoutConstraint] = [NSLayoutConstraint]()
        
        for  constraint: NSLayoutConstraint  in tempView.constraints()  as! [NSLayoutConstraint] {
            
            
            var  firstAttribute:NSLayoutAttribute = constraint.firstAttribute
            var secondAttribute:NSLayoutAttribute = constraint.secondAttribute
            
            if (self.IsValideAttribute(firstAttribute) && self.IsValideAttribute(secondAttribute)) {
                
                firstAttribute = self.changeAttributeValue(attribute: firstAttribute);
                secondAttribute = self.changeAttributeValue(attribute: secondAttribute);
                
                constraint.constant *= -1;
                
                
                var constraintNew:NSLayoutConstraint = NSLayoutConstraint(item: constraint.firstItem, attribute: firstAttribute, relatedBy: constraint.relation , toItem: constraint.secondItem , attribute:secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant);
                
                constraintsToRemove.append(constraint)
                constraintsToAdd.append(constraintNew)
                
            }
            
        }
        
        for  constraint: NSLayoutConstraint in constraintsToRemove {
            tempView.removeConstraint(constraint)
        }
        for  constraint: NSLayoutConstraint in constraintsToAdd {
            tempView.addConstraint(constraint)
        }
    }
    
    func IsValideAttribute(attribute :NSLayoutAttribute)->Bool{
        
        if  attribute == NSLayoutAttribute.Leading || attribute == NSLayoutAttribute.Trailing || attribute == NSLayoutAttribute.Left || attribute == NSLayoutAttribute.Right ||
            attribute == NSLayoutAttribute.LeadingMargin || attribute == NSLayoutAttribute.TrailingMargin || attribute == NSLayoutAttribute.LeftMargin || attribute == NSLayoutAttribute.RightMargin {
                return true
        }else{
            return false
        }
    }
    
    func changeAttributeValue(var #attribute:NSLayoutAttribute) -> NSLayoutAttribute{
        switch (attribute) {
        case NSLayoutAttribute.Leading:
            attribute = NSLayoutAttribute.Trailing;
            break;
        case NSLayoutAttribute.LeadingMargin:
            attribute = NSLayoutAttribute.TrailingMargin;
            break;
        case NSLayoutAttribute.Trailing:
            attribute = NSLayoutAttribute.Leading;
            break;
        case NSLayoutAttribute.TrailingMargin:
            attribute = NSLayoutAttribute.LeadingMargin;
            break;
        case NSLayoutAttribute.Left:
            attribute = NSLayoutAttribute.Right;
            break;
        case NSLayoutAttribute.LeftMargin:
            attribute = NSLayoutAttribute.RightMargin;
            break;
        case NSLayoutAttribute.Right:
            attribute = NSLayoutAttribute.Left;
            break;
        case NSLayoutAttribute.RightMargin:
            attribute = NSLayoutAttribute.LeftMargin;
            break;
        default:
            break;
        }
        return attribute;
    }
    
}