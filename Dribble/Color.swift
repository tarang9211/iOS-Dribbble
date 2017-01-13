//
//  Color.swift
//  Dribble
//
//  Created by Tarang Hirani on 1/12/17.
//  Copyright © 2017 Tarang Hirani. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func fromHex(hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var trimmedHexStr = hex.trimmingCharacters(in: CharacterSet.whitespaces).uppercased()
        
        if (trimmedHexStr.contains("#")) {
            trimmedHexStr.remove(at: trimmedHexStr.startIndex)
        }
        
        if (trimmedHexStr.characters.count != 6) {
            return UIColor.black
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: trimmedHexStr).scanHexInt32(&rgbValue)
        //rgbValue is the unsigned integer representation of trimmedHexStr
        
        return UIColor(
            red:    CGFloat((rgbValue & 0xff0000) >> 16) / 255.0,
            green:  CGFloat((rgbValue & 0x00ff00) >> 8) / 255.0,
            blue:   CGFloat(rgbValue & 0x0000ff) / 255.0,
            alpha:  CGFloat(alpha)
        )
    }
    
    
    public class var collectionViewBackgroundColor: UIColor  {
        return UIColor.fromHex(hex: "#ECEFF1")
    }
}
