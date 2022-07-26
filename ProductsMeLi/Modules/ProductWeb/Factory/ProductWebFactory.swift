//
//  ProductWebFactory.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

enum ProductWebFactory {
    
    static func getProductWebViewController(productUrl: String) -> ProductWebViewController {
        // viewController
        let viewController = ProductWebViewController()
        
        viewController.productUrl = productUrl
        
        return viewController
    }
    
    static func showProductWebViewController(from originViewController: UIViewController, productUrl: String) {
        let viewController = getProductWebViewController(productUrl: productUrl)
        originViewController.present(viewController, animated: true, completion: nil)
    }
    
}
