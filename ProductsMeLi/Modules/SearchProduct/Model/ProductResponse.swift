//
//  ProductResponse.swift
//  ProductsMeLi
//
//  Created by David Molina on 22/07/22.
//

import Foundation

struct ProductResponse: Decodable {
    let results: [Product]?
}
