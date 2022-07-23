//
//  ProductDescriptionRouter.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

enum ProductDescriptionTransition {
    case showProductWeb
}

class ProductDescriptionRouter {
    
    // MARK: - Internal Properties
    
    var viewController: UIViewController?
    
    // MARK: - Internal Methods
    
    func handle(transition attendanceTransition: ProductDescriptionTransition) {
        switch attendanceTransition {
        case .showProductWeb:
            showProductWebViewController()
        }
        
    }
    
    // MARK: - Private Methods
    
    private func showProductWebViewController() {
        guard let viewController = viewController else {
            return
        }
        ProductWebFactory.showProductWebViewController(from: viewController)

    }
    
}
