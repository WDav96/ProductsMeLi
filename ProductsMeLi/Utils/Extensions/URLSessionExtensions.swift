//
//  URLSessionExtensions.swift
//  ProductsMeLi
//
//  Created by David Molina on 20/07/22.
//

import Foundation

extension URLSession {
    
    func fetchData<T: Decodable>(at url: URL, completionHandler: @escaping (Result<T, Error>) -> Void) {
        self.dataTask(with: url) { (data, response, error) in
            if data != nil && error == nil {
                do {
                    let data = try JSONDecoder().decode(T.self, from: data!)
                    completionHandler(.success(data))
                } catch let decoderError {
                    completionHandler(.failure(decoderError))
                }
            }
        }
        .resume()
    }
    
    func fetchData<T: Decodable>(at url: URL) async throws -> T {
        let (data, _) = try await self.data(for: .init(url: url))
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}
