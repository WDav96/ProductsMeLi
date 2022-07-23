//
//  SearchProductViewModel.swift
//  ProductsMeLi
//
//  Created by David Molina on 20/07/22.
//

import Foundation

enum SearchProductViewModelOutput {
    case isLoading(Bool)
    case didGetData
    case errorMessage(String)
}

class SearchProductViewModel {
    
    // MARK: - Internal Properties
    
    var repository: SearchProductRepository
    var router: SearchProductRouter
    var products: [Product] = []
    
    // MARK: - Internal Observable Properties
    
    var searchText: MutableObservable<String> = MutableObservable()
    
    var outputEvents: Observable<SearchProductViewModelOutput> {
        mutableOutputEvents
    }
    
    // MARK: - Private Observable Properties
    
    private let mutableOutputEvents = MutableObservable<SearchProductViewModelOutput>()
    private var debounceTimer: Timer?
    
    // MARK: - Initializers
    
    init(repository: SearchProductRepository, router: SearchProductRouter) {
        self.repository = repository
        self.router = router
        searchText.observe { [weak self] text in self?.getProducts(productName: text) }
    }
    
    // MARK: - Private Methods
    
    private func getProducts(productName: String) {
        debounceTimer?.invalidate()
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { _ in
            Task { await self.getProductsAsyn(productName: productName) }
        }
    }
    
    private func getProductsAsyn(productName: String) async {
        guard !productName.isEmpty else {
            self.products.removeAll()
            mutableOutputEvents.postValue(.didGetData)
            return
        }
        
        do {
            mutableOutputEvents.postValue(.isLoading(true))
            let productsResponse = try await repository.getProducts(productName: productName)
            self.products = productsResponse.results ?? []
            mutableOutputEvents.postValue(.didGetData)
            mutableOutputEvents.postValue(.isLoading(false))
        } catch {
            mutableOutputEvents.postValue(.errorMessage(error.localizedDescription))
        }
    }
    
    func goToProductDescription(products: [Product]) {
        router.handle(transition: .showProductDescription(products: products))
    }

}
