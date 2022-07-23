//
//  SearchProductFactory.swift
//  ProductsMeLi
//
//  Created by David Molina on 21/07/22.
//

import UIKit

enum SearchProductFactory {
    
    static func getSearchProductViewController() -> SearchProductViewController {
        // router
        let router = SearchProductRouter()
        // repository
        let repository = SearchProductRepository()
        // viewModel
        let viewModel = SearchProductViewModel(repository: repository, router: router)
        // viewController
        let viewController = SearchProductViewController(viewModel: viewModel)
        
        router.viewController = viewController
        
        return viewController
    }
    
    static func showSearchProductViewController(from originViewController: UIViewController) {
        let viewController = getSearchProductViewController()
        originViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
