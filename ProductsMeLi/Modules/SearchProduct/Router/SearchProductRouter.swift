//
//  SearchProductRouter.swift
//  ProductsMeLi
//
//  Created by David Molina on 22/07/22.
//

import UIKit

enum SearchProductTransition {
    case showProductDescription(product: Product, products: [Product])
}

class SearchProductRouter {
    
    // MARK: - Internal Properties
    
    var viewController: UIViewController?
    
    // MARK: - Internal Methods
    
    func handle(transition attendanceTransition: SearchProductTransition) {
        switch attendanceTransition {
        case let .showProductDescription(product, products):
            showProductDescriptionViewController(product: product, products: products)
        }
        
    }
    
    // MARK: - Private Methods
    
    private func showProductDescriptionViewController(product: Product, products: [Product]) {
        guard let viewController = viewController else {
            return
        }
        ProductDescriptionFactory.showProductDescriptionViewController(from: viewController, product: product, products: products)

    }
    
}
