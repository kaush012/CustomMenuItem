//
//  UtilityClass.swift
//  VisualEffectView
//
//  Created by Ruby Kaushik on 12/28/16.
//  Copyright © 2016 Ruby Kaushik. All rights reserved.
//

import Cocoa

class UtilityClass: NSObject {
  
   static var visualEffectView : NSVisualEffectView?
   static let sharedInstance = UtilityClass()
  
  
  class func visualEffectViewInstance(frame : NSRect) -> NSVisualEffectView {
    if visualEffectView == nil {
      visualEffectView = NSVisualEffectView(frame: frame)
      visualEffectView!.blendingMode = .behindWindow
      visualEffectView!.isEmphasized = true
      visualEffectView!.material = .selection
      visualEffectView!.state = .active
    }
    return visualEffectView!
  }
  
  class func updateVisualEffectView(frame : NSRect) {
    if self.visualEffectView != nil {
      if #available(OSX 10.12, *) {
        if UtilityClass.sharedInstance.isSystemInDarkMode() && NSColor.currentControlTint == NSControlTint.graphiteControlTint {
          visualEffectView!.isEmphasized = false
        }
        else {
          visualEffectView!.isEmphasized = true
        }
      }
    }
  }
  
  
  func isSystemInDarkMode() -> Bool {
    if let modeName = UserDefaults.standard.string(forKey: "AppleInterfaceStyle") {
      if modeName == "Light" {
        return false
      }
      return true
    }
    return false
  }
}
