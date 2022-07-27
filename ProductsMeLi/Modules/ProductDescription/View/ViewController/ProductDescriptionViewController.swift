//
//  ProductDescriptionViewController.swift
//  ProductsMeLi
//
//  Created by David Molina on 21/07/22.
//

import UIKit

class ProductDescriptionViewController: UIViewController {
    
    // MARK: - Private UI properites
    
    private lazy var productDescriptionView: ProductDescriptionView = {
        let view = ProductDescriptionView()
        view.setTableViewDelegates(adapter, adapter)
        return view
    }()
    
    // MARK: - Internal Properties
    
    var product: Product? {
        didSet {
            productDescriptionView.product = product
        }
    }
    
    var products: [Product] = [] {
        didSet {
            updateTableView()
        }
    }
    
    // MARK: - Private Properties
    
    private var adapter = ProductDescriptionAdapter()
    private var viewModel: ProductDescriptionViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ProductDescriptionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController Methods
    
    override func loadView() {
        super.loadView()
        view = productDescriptionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()

    }
    
    // MARK: - Private Methods

    private func setupBindings() {
        productDescriptionView.onTapSeeMoreButtonObservable.observe { [unowned self] productUrl in
            viewModel.goToProductWebView(productUrl: productUrl)
        }
        adapter.didTappedCell.observe { [unowned self] productUrl in
            viewModel.goToProductWebView(productUrl: productUrl)
        }
    }
    
    private func updateTableView() {
        let tenProducts = products[0...]
        adapter.products = tenProducts.filter( { $0.title != product?.title })
        
        productDescriptionView.reloadTableViewData()
    }

}
