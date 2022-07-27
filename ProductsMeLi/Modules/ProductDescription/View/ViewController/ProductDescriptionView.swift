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
        stackView.spacing = 20
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
    
    private lazy var seeMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver más", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.addTarget(self, action: #selector(seeMoreButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var relatedProductLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Productos relacionados"
        label.textColor = .black
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RelatedTableViewCell.self, forCellReuseIdentifier: RelatedTableViewCell.name)
        return tableView
    }()
    
    // MARK: - Internal Properties
    
    var product: Product? {
        didSet {
            setupView()
        }
    }
    
    // MARK: - Private Properties
    
    private var adapter = ProductDescriptionAdapter()
    private var imageService = ImageService()
    
    // MARK: - Internal Observable Properties
    var onTapSeeMoreButtonObservable: Observable<String> {
        onTapSeeMoreButton
    }
    
    // MARK: - Private Observable Properties
    
    private var onTapSeeMoreButton = MutableObservable<String>()
    
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
    
    private func addSubViews() {
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(nameProductLabel)
        containerStackView.addArrangedSubview(productImageView)
        containerStackView.addArrangedSubview(priceProductLabel)
        containerStackView.addArrangedSubview(seeMoreButton)
        containerStackView.addArrangedSubview(relatedProductLabel)
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
    
    @objc
    private func seeMoreButtonAction(sender: UIButton!) {
        onTapSeeMoreButton.postValue((product?.productUrl))
    }
    
    private func setupView() {
        nameProductLabel.text = product?.title
        priceProductLabel.text = "$ \(product?.price ?? 0) COP"
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
