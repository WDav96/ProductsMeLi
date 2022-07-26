//
//  ProductWebView.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit
import WebKit

class ProductWebView: UIView {

    // MARK: - Private UI Properties
    
    private var webView: WKWebView!
    
    // MARK: - Internal Properties
    
    var productUrl: String? {
        didSet {
            load(url: productUrl ?? "https://www.mercadolibre.com.co")
        }
    }
    
    // MARK: - Private Properties
    
    private let webViewPrefs = WKWebpagePreferences()
    private let webViewConf = WKWebViewConfiguration()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupWebView()
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupWebView() {
        webView = WKWebView(frame: self.frame, configuration: webViewConf)
        webView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        webViewPrefs.allowsContentJavaScript = true
        webViewConf.defaultWebpagePreferences = webViewPrefs
    }
    
    private func addSubViews() {
        addSubview(webView)
    }
    
    private func load(url: String) {
        webView.load(URLRequest(url: URL(string: url)!))
    }

}
