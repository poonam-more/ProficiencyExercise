//
//  UIView+Extension.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func topAnchor(top: NSLayoutYAxisAnchor?, padding: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
        }
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            print("constant = \(padding+topInset)")
            self.topAnchor.constraint(equalTo: top, constant: padding+topInset).isActive = true
        }
    }
    func bottomAnchor(bottom: NSLayoutYAxisAnchor?, padding: CGFloat, enableInsets: Bool) {
        var bottomInset = CGFloat(0)
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            bottomInset = insets.bottom
        }
        translatesAutoresizingMaskIntoConstraints = false
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding-bottomInset).isActive = true
        }
    }
    func leftAnchor(left: NSLayoutXAxisAnchor?, padding: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: padding).isActive = true
        }
    }
    func rightAnchor(right: NSLayoutXAxisAnchor?, padding: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -padding).isActive = true
        }
    }
    func widthAnchor(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    func heightAnchor(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if height != 0 {
            widthAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
