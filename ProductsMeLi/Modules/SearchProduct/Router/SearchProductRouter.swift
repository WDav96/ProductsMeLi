//
//  SearchProductRouter.swift
//  ProductsMeLi
//
//  Created by David Molina on 22/07/22.
//

import UIKit

enum SearchProductTransition {
    case showProductDescription(products: [Product])
}

class SearchProductRouter {
    
    // MARK: - Internal Properties
    
    var viewController: UIViewController?
    
    // MARK: - Internal Methods
    
    func handle(transition attendanceTransition: SearchProductTransition) {
        switch attendanceTransition {
        case let .showProductDescription(products):
            showProductDescriptionViewController(products: products)
        }
        
    }
    
    // MARK: - Private Methods
    
    private func showProductDescriptionViewController(products: [Product]) {
        guard let viewController = viewController else {
            return
        }
        ProductDescriptionFactory.showProductDescriptionViewController(from: viewController, products: products)

    }
    
}
