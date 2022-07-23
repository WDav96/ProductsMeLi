//
//  ProductWebFactory.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

enum ProductWebFactory {
    
    static func getProductWebViewController() -> ProductWebViewController {
        // viewController
        let viewController = ProductWebViewController()
        
        return viewController
    }
    
    static func showProductWebViewController(from originViewController: UIViewController) {
        let viewController = getProductWebViewController()
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
