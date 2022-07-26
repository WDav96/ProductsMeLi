//
//  ProductDescriptionRouter.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

enum ProductDescriptionTransition {
    case showProductWeb(productUrl: String)
}

class ProductDescriptionRouter {
    
    // MARK: - Internal Properties
    
    var viewController: UIViewController?
    
    // MARK: - Internal Methods
    
    func handle(transition attendanceTransition: ProductDescriptionTransition) {
        switch attendanceTransition {
        case let .showProductWeb(productUrl):
            showProductWebViewController(productUrl: productUrl)
        }
        
    }
    
    // MARK: - Private Methods
    
    private func showProductWebViewController(productUrl: String) {
        guard let viewController = viewController else {
            return
        }
        ProductWebFactory.showProductWebViewController(from: viewController, productUrl: productUrl)

    }
    
}
