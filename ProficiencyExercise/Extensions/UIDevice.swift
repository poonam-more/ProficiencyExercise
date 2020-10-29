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
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
