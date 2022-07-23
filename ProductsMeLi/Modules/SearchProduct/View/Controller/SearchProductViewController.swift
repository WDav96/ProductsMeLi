//
//  ViewController.swift
//  ProductsMeLi
//
//  Created by BigSur on 20/07/22.
//

import UIKit

class SearchProductViewController: UIViewController {

    // MARK: - Private UI properites
    
    private lazy var searchProductView: SearchProductView = {
        let view = SearchProductView()
        view.setTableViewDelegates(adapter, adapter)
        return view
    }()
    
    // MARK: - Private Properties
    
    private var adapter = SearchProductAdapter()
    private var viewModel: SearchProductViewModel
    
    // MARK: - Initializers
    
    init(viewModel: SearchProductViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = searchProductView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    // MARK: - Private Methods
    
    private func setupBindings() {
        // viewModel to View
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
        // view To viewModel
        searchProductView.publicSearchProductTextField.bind(with: viewModel.searchText)
        
        adapter.didSelectItemAt.observe { [unowned self] products in
            self.goToProductDescription(products: products)
        }
    }
    
    private func validateEvents(event: SearchProductViewModelOutput) {
        switch event {
        case .isLoading(let isLoading):
            if isLoading {
                showSpinner(onView: view)
            } else {
                removeSpinner()
            }
        case .didGetData:
            updateTableView()
        case .errorMessage(let error):
            print(error)
        }
    }
    
    private func updateTableView() {
        adapter.products = viewModel.products
        searchProductView.reloadTableViewData()
    }
    
    private func goToProductDescription(products: [Product]) {
        viewModel.goToProductDescription(products: products)
    }

}
