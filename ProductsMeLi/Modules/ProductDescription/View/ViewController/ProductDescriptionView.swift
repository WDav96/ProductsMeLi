//
//  ProductDescriptionView.swift
//  ProductsMeLi
//
//  Created by David Molina on 21/07/22.
//

import UIKit

class ProductDescriptionView: UIView {

    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    private var nameProductLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.withRoundedBorders(withBorder: true)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var priceProductLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 35, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private var seeMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver más", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(seeMoreButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.name)
        return tableView
    }()
    
    // MARK: - Internal Properties
    
    var products: [Product] = [] {
        didSet {
            updateTableView()
        }
    }
    
    // MARK: - Private Properties
    
    private var adapter = ProductDescriptionAdapter()
    private var imageService = ImageService()
    
    // MARK: - Internal Observable Properties
    var onTapSeeMoreButtonObservable: Observable<Void> {
        onTapSeeMoreButton
    }
    
    private var onTapSeeMoreButton = MutableObservable<Void>()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    func setTableViewDelegates(_ delegate: UITableViewDelegate, _ datasource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = datasource
    }

    func reloadTableViewData() {
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    
    @objc
    private func seeMoreButtonAction(sender: UIButton!) {
        onTapSeeMoreButton.postValue(())
    }
    
    private func addSubViews() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(nameProductLabel)
        containerStackView.addArrangedSubview(productImageView)
        containerStackView.addArrangedSubview(priceProductLabel)
        containerStackView.addArrangedSubview(seeMoreButton)
        addSubview(tableView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        // nameProductLabel
        nameProductLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameProductLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        nameProductLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        // productImageView
        productImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        productImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        // seeMoreButton
        seeMoreButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        // tableView
        tableView.topAnchor.constraint(equalTo: containerStackView.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    private func updateTableView() {
        adapter.products = products
        setupView()
    }
    
    private func setupView() {
        /*nameProductLabel.text = product?.title
        priceProductLabel.text = "$ \(product?.price ?? 0) COP"
        let url = product?.image ?? ""
        setupImage(url: url)*/
    }
    
    private func setupImage(url: String) {
        guard let url = URL(string: url) else { return }
        imageService.image(for: url) { image in
            self.productImageView.image = image
        }
    }
    
}
