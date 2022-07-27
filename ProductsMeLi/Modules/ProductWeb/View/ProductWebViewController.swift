//
//  ProductWebViewController.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit
import WebKit

class ProductWebViewController: UIViewController {

    // MARK: - Private UI properites
    
    private lazy var productWebView = ProductWebView()
    
    // MARK: - Lifecycle ViewController Methods
    
    // MARK: - Internal Properties
    
    var productUrl: String? {
        didSet {
            productWebView.productUrl = productUrl
        }
    }
    
    override func loadView() {
        super.loadView()
        view = productWebView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - Private Methods

    private func setupBindings() {
        productWebView.onTapCloseButtonObservable.observe { [unowned self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismiss(animated:true, completion: nil)
            }
        }
    }
    

}
