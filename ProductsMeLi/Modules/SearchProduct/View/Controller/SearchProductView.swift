//
//  SearchProductView.swift
//  ProductsMeLi
//
//  Created by BigSur on 20/07/22.
//

import UIKit

class SearchProductView: UIView {

    // MARK: - Private UI Properties
    
    private var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.backgroundColor = .yellowMainColor
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Products"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private var searchProductTextField: UITextField = {
       let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Search"
        return textfield
    }()
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.name)
        return tableView
    }()
    
    var publicSearchProductTextField: UITextField { searchProductTextField }
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        addSubViews()
        backgroundColor = .white
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
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(searchProductTextField)
        containerStackView.addArrangedSubview(tableView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        // containerStackView
        containerStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerStackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerStackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        // titleLabel
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        // searchProductTextField
        searchProductTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        searchProductTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        searchProductTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }

}
