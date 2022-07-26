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

    }
    
    // MARK: - Private Methods
    

}