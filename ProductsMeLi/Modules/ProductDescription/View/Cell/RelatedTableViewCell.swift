//
//  RelatedTableViewCell.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

class RelatedTableViewCell: UITableViewCell {
    
    static let name = String(describing: RelatedTableViewCell.self)

    // MARK: - Private UI Properties
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.delegate = adapter
        collectionView.dataSource = adapter
        collectionView.register(RelatedCollectionViewCell.self, forCellWithReuseIdentifier: RelatedCollectionViewCell.name)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 10)
        return layout
    }()
    
    // MARK: - Internal Properties
    
    var products: [Product] = [] {
        didSet {
            updateCollectionView()
        }
    }
    
    // MARK: - Internal Observable Properties
    
    var didSelectItemAtObservable: Observable<String> {
        didSelecItemAtMutableObservable
    }
    
    // MARK: - Private Observable Properties
    
    private var didSelecItemAtMutableObservable = MutableObservable<String>()
    
    // MARK: - Private Properties
    
    private var adapter = RelatedCollectionViewAdapter()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        contentView.addSubview(collectionView)

        addConstraints()
    }
    
    private func addConstraints() {
        // collectionView
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setupBindings() {
        adapter.didSelectItemAtObservable.observe { [unowned self] productUrl in
            self.didSelecItemAtMutableObservable.postValue(productUrl)
            
        }
    }
    
    private func updateCollectionView() {
        adapter.products = products
        collectionView.reloadData()
    }

}
