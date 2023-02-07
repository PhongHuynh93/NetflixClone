//
//  Extensions.swift
//  NetflixClone
//
//  Created by Huynh Phong on 04/02/2023.
//

import Foundation

protocol ScopeFunc { }
extension ScopeFunc {
  @inline(__always) func apply(block: (Self) -> ()) -> Self {
    block(self)
    return self
  }
  @inline(__always) func run(block: (Self) -> ()) {
    block(self)
  } 
  @inline(__always) func letIt<R>(block: (Self) -> R) -> R {
    return block(self)
  }
}
extension NSObject: ScopeFunc { }
