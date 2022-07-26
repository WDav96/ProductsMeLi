//
//  SearchProductAdapter.swift
//  ProductsMeLi
//
//  Created by David Molina on 20/07/22.
//

import UIKit

class SearchProductAdapter: NSObject {
    
    // MARK: - Internal Properties
    
    var products: [Product] = []
    
    // MARK: - Internal Observable Properties
    
    var didSelectItemAt: Observable<(Product, [Product])> {
        mutableDidSelectItemAt
    }
    
    // MARK: - Private Observable Properties
    
    private var mutableDidSelectItemAt = MutableObservable<(Product, [Product])>()
    
}

// MARK: - UITableViewDataSource
extension SearchProductAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.name) as? ProductTableViewCell else { return UITableViewCell() }
        cell.product = products[indexPath.row]
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension SearchProductAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mutableDidSelectItemAt.postValue((products[indexPath.row], products))
    }
    
}
