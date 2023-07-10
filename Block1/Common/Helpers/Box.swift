//
//  Box.swift
//  Block1
//
//  Created by Сергей Золотухин on 09.07.2023.
//

final class Box<T> {
  //1 Each Box can have a Listener that Box notifies when the value changes.
  typealias Listener = (T) -> Void
  var listener: Listener?
  //2 Box has a generic type value. The didSet property observer detects any changes and notifies Listener of any value update.
  var value: T {
    didSet {
      listener?(value)
    }
  }
  //3 The initializer sets Box‘s initial value.
  init(_ value: T) {
    self.value = value
  }
  //4 When a Listener calls bind(listener:) on Box, it becomes Listener and immediately gets notified of the Box‘s current value.
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
