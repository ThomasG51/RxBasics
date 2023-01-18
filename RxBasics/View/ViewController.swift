//
//  ViewController.swift
//  RxBasics
//
//  Created by Thomas George on 18/01/2023.
//

import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
    // MARK: - Property
    
    private let viewModel = ProductViewModel()
    
    private var disposeBag = DisposeBag()
    
    private var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    // MARK: - IBOutlet
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    // MARK: - IBAction
    
    // MARK: - Navigation
    
    // MARK: - Function
    
    // MARK: - Private Function
    
    private func bindTableData() {
        // Bind products to TableView
        viewModel.products.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { _, product, cell in
            cell.textLabel?.text = product.name
            cell.imageView?.image = UIImage(systemName: product.imageName)
        }.disposed(by: disposeBag)
        
        // Model selected handler (DidSelected)
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.name)
        }.disposed(by: disposeBag)
        
        viewModel.fetchProducts()
    }
    
    // MARK: - Objc Function
}
