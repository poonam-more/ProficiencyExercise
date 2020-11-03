//
//  UIDevice.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 28/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    //iOS Devices having notch
    var hasNotch: Bool {
      if #available(iOS 13, *) {
        let bottom = UIApplication.shared.windows.filter {$0.isKeyWindow}.first!.safeAreaInsets.bottom
        return bottom > 0
      } else {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
      }
    }
}
