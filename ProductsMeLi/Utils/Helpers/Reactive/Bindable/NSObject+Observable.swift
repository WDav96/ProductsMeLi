//
//  NSObject+Observable.swift
//  SimpleTwoWayBinding
//
//  Created by Manish Katoch on 11/26/17.
//  Modified by J.R on 21/07/22.
// 
//

import Foundation

extension NSObject {
    public func observe<T>(for observable: MutableObservable<T>, with: @escaping (T) -> ()) {
        observable.bind { _, value  in
            DispatchQueue.main.async {
                with(value)
            }
        }
    }
}
