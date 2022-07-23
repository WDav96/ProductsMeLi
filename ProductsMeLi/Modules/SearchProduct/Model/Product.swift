//
//  Result.swift
//  ProductsMeLi
//
//  Created by David Molina on 20/07/22.
//

import Foundation

struct Product: Decodable {
    let title: String?
    let price: Int?
    let image: String?
    let productUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case price
        case image = "thumbnail"
        case productUrl = "permalink"
    }
    
}
