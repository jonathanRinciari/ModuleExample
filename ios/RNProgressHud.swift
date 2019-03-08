//
//  RNProgressHud.swift
//  ModuleExample
//
//  Created by Jonathan Rinciari on 3/6/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import ProgressHUD

@objc(RNProgressHud)
class RNProgressHud: NSObject {
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  @objc
  func showSuccess(_ message: String, options colorOptions: [String : String]) {
    self.setProgressHud(message, colorOptions, "success");
  }
  
  @objc
  func showLoading(_ message : String, options colorOptions: [String : String]) {
    self.setProgressHud(message, colorOptions, "loading")
  }
  
  @objc
  func showError(_ message: String, options colorOptions: [String : String]) {
      self.setProgressHud(message, colorOptions, "error")
  }
  
  @objc
  func dismiss() {
    ProgressHUD.dismiss();
  }
  
  private func setProgressHud(_ message : String?, _ colors: [String : String], _ type : String) {
    
    if let hudColor = colors["hudColor"] {

      ProgressHUD.hudColor(hexConvertUtil(hex: hudColor));
    }
    
    if let spinnerColor = colors["spinnerColor"] {
      ProgressHUD.spinnerColor(hexConvertUtil(hex: spinnerColor))
    }
    
    if let backgroundColor = colors["backgroundColor"] {
      ProgressHUD.backgroundColor(hexConvertUtil(hex: backgroundColor))
    }
    
    if let statusColor = colors["statusColor"] {
      ProgressHUD.statusColor(hexConvertUtil(hex: statusColor))
    }
    
    if let userMessage = message {
      self.showSpinner(userMessage, hudType: type)
    } else {
      if type == "success" {
        showSpinner("", hudType: "success_without_message")
      } else if type == "error" {
        showSpinner("", hudType: "error_without_message")
      } else {
        showSpinner("", hudType: "")
      }
    }
  }
  
  private func showSpinner(_  message : String, hudType : String) {
    switch hudType {
    case "success":
      ProgressHUD.showSuccess(message);
    case "success_without_message":
      ProgressHUD.showSuccess();
    case "error":
      ProgressHUD.showError(message);
    case "error_without_message":
      ProgressHUD.showError();
    case "loading":
      ProgressHUD.show();
    default:
      ProgressHUD.show();
    }
  }
  
  
  private func hexConvertUtil(hex: String) -> UIColor {
      var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      
      if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
      }
      
      if ((cString.count) != 6) {
        return UIColor.gray
      }
      
      var rgbValue:UInt32 = 0
      Scanner(string: cString).scanHexInt32(&rgbValue)
      
      return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
      )
    }
}
