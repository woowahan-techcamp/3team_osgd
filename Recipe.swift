//
//  Recipe.swift
//  fling
//
//  Created by woowabrothers on 2017. 8. 9..
//  Copyright © 2017년 osgd. All rights reserved.
//

import Foundation

class Recipe {

    let rid: Int
    let title: String
    let subtitle: String
    let url: String
    let image: String
    let writer: String
    public private(set) var products: [Product]
    typealias ListProduct = [(product: Product, number: Int)]

    init() {
        self.rid = 0
        self.title = ""
        self.subtitle = ""
        self.url = ""
        self.image = ""
        self.writer = ""
        self.products = [Product]()
    }

    init(rid: Int, title: String, subtitle: String, url: String, image: String, writer: String, products: [Product]) {
        self.rid = rid
        self.title = title
        self.subtitle = subtitle
        self.url = url
        self.image = image
        self.writer = writer
        self.products = products
    }

    init?(data: [String:Any]) {
        guard let id = data["id"]! as? Int,
            let title = data["title"]! as? String,
            let subtitle = data["subtitle"]! as? String,
            let url = data["url"]! as? String,
            let image = data["image"]! as? String,
            let writer = data["writer"]! as? String else {
                return nil
        }
//        guard let products = data["products"]! as? String else {
//            return
//        }

        self.rid = id
        self.title = title
        self.subtitle = subtitle
        self.url = url
        self.image = image
        self.writer = writer
        self.products = []
    }

    func numberOf(product: Product) -> Int {
        var result = 0
        products.forEach { object in
            if object == product {
                result += 1
            }
        }

        return result
    }

    func listOfProducts() -> ListProduct {
        func indexOf(list: ListProduct, product: Product) -> Int {
            var result = -1
            for (index, object) in list.enumerated() where object.product == product {
                result = index
            }
            return result
        }

        var result = ListProduct()
        products.forEach { product in
            let index = indexOf(list: result, product: product)
            if index != -1 {
                result[index].number += 1
            } else {
                result.append((product: product, number: 1))
            }
        }
        return result
    }

    func totalPrice() -> Decimal {
        var total = Decimal()
        products.forEach { object in
            total += object.getPrice()
        }

        return total
    }

    func add(product: Product, number: Int) {
        for _ in 1...number {
            products.append(product)
        }
    }

    func update(product: Product, newNumber: Int) {
        let number = numberOf(product: product)

        if newNumber > number {
            self.add(product: product, number: newNumber-number)
        } else if newNumber < number {
            for _ in 1...(newNumber-number) {
                if let index = products.index(of: product) {
                    products.remove(at: index)
                }
            }
        } else {
            //아무것도 안함
        }
    }

    func checked(product: Product, number: Int) {

    }

    func unchecked(proudct: Product) {

    }
}
