//: Playground - noun: a place where people can play

import UIKit

import Foundation

class CancelableTask {
  
  typealias Handler = () -> ()
  
  private var cancelled: Bool = false
  
  func cancelOperation() {
    self.cancelled = true
  }
  
  public static func dispatch(queue: DispatchQueue, completionHandler: @escaping Handler) -> CancelableTask {
    let task = CancelableTask()
    if cancelled == false {
      queue.async{
        completionHandler()
      }
    }
    return task
  }
}


