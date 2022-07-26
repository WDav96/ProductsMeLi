//
//  ProductDescriptionFactory.swift
//  ProductsMeLi
//
//  Created by David Molina on 22/07/22.
//

import UIKit

enum ProductDescriptionFactory {
    
    static func getProductDescriptionViewController(product: Product, products: [Product]) -> ProductDescriptionViewController {
        // router
        let router = ProductDescriptionRouter()
        // viewModel
        let viewModel = ProductDescriptionViewModel(router: router)
        // viewController
        let viewController = ProductDescriptionViewController(viewModel: viewModel)
        viewController.product = product
        viewController.products = products
        router.viewController = viewController
        
        return viewController
    }
    
    static func showProductDescriptionViewController(from originViewController: UIViewController, product: Product, products: [Product]) {
        let viewController = getProductDescriptionViewController(product: product, products: products)
        originViewController.navigationController?.present(viewController, animated: true)
    }
    
}
