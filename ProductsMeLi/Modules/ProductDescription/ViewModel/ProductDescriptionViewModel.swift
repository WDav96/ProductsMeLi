//
//  ProductDescriptionViewModel.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import Foundation

class ProductDescriptionViewModel {
    
    // MARK: - Internal Properties
    
    var router: ProductDescriptionRouter
    
    // MARK: - Initializers
    
    init(router: ProductDescriptionRouter) {
        self.router = router

    }
    
    // MARK: - Private Methods
    
    func goToProductWebView(productUrl: String) {
        router.handle(transition: .showProductWeb(productUrl: productUrl))
    }
    
    
}
