//
//  SearchProductRepositoryMock.swift
//  ProductsMeLiTests
//
//  Created by _ on 25/07/22.
//

import Foundation
@testable import ProductsMeLi

class SearchProductRepositoryMock: SearchProductRepositoryProtocol {
    
    func getProducts(productName: String) async throws -> ProductResponse {
        return ProductResponse(results: [Product(title: "Celular", price: 1, image: nil, productUrl: nil)])
    }
}
