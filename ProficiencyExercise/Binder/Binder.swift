//
//  Binder.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 28/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation

final class Binder<T> {
  typealias Listener = (T) -> Void
  var listener: Listener?
  var value: T {
    didSet {
      listener?(value)
    }
  }
  init(_ value: T) {
    self.value = value
  }
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
