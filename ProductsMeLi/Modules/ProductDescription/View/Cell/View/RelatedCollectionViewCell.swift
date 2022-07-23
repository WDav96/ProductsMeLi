//
//  RelatedCollectionViewCell.swift
//  ProductsMeLi
//
//  Created by David Molina on 23/07/22.
//

import UIKit

class RelatedCollectionViewCell: UICollectionViewCell {
    
    static let name = String(describing: RelatedCollectionViewCell.self)
    
    // MARK: - Private UI Properties
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.withRoundedBorders(withBorder: true)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    // MARK: - Internal Properties
    
    var product: Product? {
        didSet {
            setupProduct()
        }
    }
    
    // MARK: - Private Properties
    
    private var imageService = ImageService()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)

        addConstraints()
    }
    
    private func addConstraints() {
        // productImageView
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        productImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        // titleLabel
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        // priceLabel
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 15).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupProduct() {
        titleLabel.text = product?.title
        priceLabel.text = "$ \(product?.price ?? 0) COP"
        let url = product?.image ?? ""
        setupImage(url: url)
    }
    
    private func setupImage(url: String) {
        guard let url = URL(string: url) else { return }
        imageService.image(for: url) { image in
            self.productImageView.image = image
        }
    }
}
