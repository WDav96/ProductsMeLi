//
//  RelatedCollectionViewAdapter.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

class RelatedCollectionViewAdapter: NSObject {
    
    // MARK: - Internal Properties
    
    var products: [Product] = []
    
}

// MARK: - UICollectionViewDataSource
extension RelatedCollectionViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelatedCollectionViewCell.name, for: indexPath) as? RelatedCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.product = products[indexPath.row]
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RelatedCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 30, height: collectionView.frame.height)
    }
    
}
