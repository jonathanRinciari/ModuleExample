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
  private var errorOptions: [String : String] = [
    "hudColor" : "#FFFFFF",
    
  ]
  @objc
  func constantsToExport() -> [AnyHashable : Any]! {
    return ["working": true]
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  // Add Methods to update styling to each pop up style
  // Spinner Color
  // Hud Color
  
  @objc
  func setOptions(_ data: [String: String], hudType type: String) {
    
    self.errorOptions["hudColor"] = UIColor.init(hexString: "#aad4da");
  }
  
  @objc
  func showSuccess(_ message: String) {
//    ProgressHUD.hudColor(UIColor.init(red: 18, green: 124, blue: 23, alpha: 1))
    ProgressHUD.showSuccess(message)
  }
  
  @objc
  func showError(_ message: String) {
    print(errorOptions)
    ProgressHUD.hudColor(self.errorOptions["hudColor"]);
    ProgressHUD.showError(message)
  }
  
  @objc
  func showLoading() {
    ProgressHUD.show();
  }
  
}
