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
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "closeIcon"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        return button
    }()
    
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
    
    // MARK: - Internal Observable Properties
    var onTapCloseButtonObservable: Observable<Void> {
        onTapCloseButton
    }
    
    // MARK: - Private Observable Properties
    
    private var onTapCloseButton = MutableObservable<Void>()
    
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
        webView.addSubview(closeButton)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // closeButton
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        closeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func load(url: String) {
        webView.load(URLRequest(url: URL(string: url)!))
    }
    
    @objc
    private func closeButtonAction() {
        onTapCloseButton.postValue(())
    }

}
