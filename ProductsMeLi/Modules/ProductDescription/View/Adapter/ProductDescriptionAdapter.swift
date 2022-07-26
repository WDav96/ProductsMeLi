//
//  ProductDescriptionAdapter.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

class ProductDescriptionAdapter: NSObject {
    
    // MARK: - Internal Properties
    
    var products: [Product] = []
    
    // MARK: - Internal Observable Properties
    
    var didSelectItemAt: Observable<Product> {
        mutableDidSelectItemAt
    }
    
    // MARK: - Private Observable Properties
    
    private var mutableDidSelectItemAt = MutableObservable<Product>()
    
}

// MARK: - UITableViewDataSource
extension ProductDescriptionAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RelatedTableViewCell.name, for: indexPath) as? RelatedTableViewCell else { return
            UITableViewCell() }
        cell.products = products
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension ProductDescriptionAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
}
