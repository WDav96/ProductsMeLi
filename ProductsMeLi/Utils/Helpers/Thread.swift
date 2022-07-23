//
//  Thread.swift
//  ProductsMeLi
//
//  Created by J.R. on 21/07/22.
//

import Foundation

enum Thread {

    static func main(_ block: @escaping () -> Void?) {
        DispatchQueue.main.async {
            block()
        }
    }
}
