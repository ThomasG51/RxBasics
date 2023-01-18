//
//  ProductViewModel.swift
//  RxBasics
//
//  Created by Thomas George on 18/01/2023.
//

import Foundation
import RxCocoa
import RxSwift

struct ProductViewModel {
    // MARK: - Property

    var products = PublishSubject<[Product]>()

    // MARK: - Function

    func fetchProducts() {
        let items = [
            Product(imageName: "house", name: "Home"),
            Product(imageName: "gear", name: "Settings"),
            Product(imageName: "person.circle", name: "Profile"),
            Product(imageName: "airplane", name: "Flights"),
            Product(imageName: "bell", name: "Activity")
        ]

        products.onNext(items)
        products.onCompleted()
    }
}
