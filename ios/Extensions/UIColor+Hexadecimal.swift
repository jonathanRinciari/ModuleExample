//
//  UIColor+Hexadecimal.swift
//  ModuleExample
//
//  Created by Jonathan Rinciari on 3/7/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation;
import UIKit;


extension UIColor {
  public convenience init?(hex: String) {
    let r, g, b, a: CGFloat
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") {
      cString.remove(at: cString.startIndex)
      var rgbValue:UInt32 = 0
      print(cString);
      Scanner(string: cString).scanHexInt32(&rgbValue)
      r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
      g = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
      b = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
      a = CGFloat(rgbValue & 0x0000FF) / 255.0
      self.init(red: r, green: g, blue: b, alpha: a)
      return
    }
    return nil
  }
}
