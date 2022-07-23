//
//  ProductDescriptionFactory.swift
//  ProductsMeLi
//
//  Created by David Molina on 22/07/22.
//

import UIKit

enum ProductDescriptionFactory {
    
    static func getProductDescriptionViewController(products: [Product]) -> ProductDescriptionViewController {
        // router
        let router = ProductDescriptionRouter()
        // viewModel
        let viewModel = ProductDescriptionViewModel(router: router)
        // viewController
        let viewController = ProductDescriptionViewController(viewModel: viewModel)
        
        viewController.products = products
        router.viewController = viewController
        
        return viewController
    }
    
    static func showProductDescriptionViewController(from originViewController: UIViewController, products: [Product]) {
        let viewController = getProductDescriptionViewController(products: products)
        originViewController.navigationController?.present(viewController, animated: true)
    }
    
}
