//
//  SearchProductRepository.swift
//  ProductsMeLi
//
//  Created by David Molina on 20/07/22.
//

import Foundation

protocol SearchProductRepositoryProtocol {
    func getProducts(productName: String) async throws -> ProductResponse
}

class SearchProductRepository: SearchProductRepositoryProtocol {
    
    // MARK: - Internal Methods
    
    func getProducts(productName: String) async throws -> ProductResponse {
        let query = productName.replacingOccurrences(of: " ", with: "&")
        let url = URL(string: "https://api.mercadolibre.com/sites/MCO/search?q=\(query)")!
        return try await URLSession.shared.fetchData(at: url)
    }
    
}
