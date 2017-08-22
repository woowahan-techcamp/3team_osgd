//
//  Product.swift
//  fling
//
//  Created by woowabrothers on 2017. 8. 9..
//  Copyright © 2017년 osgd. All rights reserved.
//

import Foundation

class Product {

    let pid: Int //상품 아이디
    let mid: Int //재료 아이디(참조)
    let name: String
    let price: Decimal
    let weight: String
    let bundle: String
    let image: String
    let materialName: String

    init() {
        self.pid = 0
        self.mid = 0
        self.name = ""
        self.price = 0
        self.weight = ""
        self.bundle = ""
        self.image = ""
        self.materialName = ""
    }

    init(pid: Int, mid: Int, name: String, price: Decimal,
         weight: String, bundle: String, image: String, materialName: String) {
        self.pid = pid
        self.mid = mid
        self.name = name
        self.price = price
        self.weight = weight
        self.bundle = bundle
        self.image = image
        self.materialName = materialName
    }

    init?(data: [String:Any]) {
        guard let pid = data["id"]! as? Int,
            let name = data["name"]! as? String,
            let price = data["price"]! as? String,
            let weight = data["weight"]! as? String,
            let bundle = data["bundle"]! as? String,
            let image = data["image"]! as? String,
            let materialName = data["material_name"] as? String,
            let mid = data["material_id"] as? Int else {
                return nil
        }

        let decimalPrice = NSDecimalNumber.init(string: price.replacingOccurrences(of: ",", with: ""))

        self.pid = pid
        self.mid = mid
        self.name = name
        self.price = decimalPrice as Decimal
        self.weight = weight
        self.bundle = bundle
        self.image = image
        self.materialName = materialName
    }

    func getBundleTuple(input: String) -> (number: Int, unit: String) {
        var bundle = input
        var number = ""
        var unit = ""

        if input == "" {
            bundle = self.bundle
        }

        for character in bundle.characters {
            if Int.init(character.description) != nil {
                number.append(character)
            } else if character.description == " " {
                //pass
            } else {
                unit.append(character)
            }
        }

        guard let converted = Int.init(number) else {
            return (number: 1, unit: "개")
        }

        if unit == "" {
            unit = "개"
        }

        return (number: converted, unit: unit)
    }

    func getBundleString(input: String) -> String {
        var bundle = input
        var number = ""
        var unit = ""

        if input == "" {
            bundle = self.bundle
        }

        for character in bundle.characters {
            if Int.init(character.description) != nil {
                number.append(character)
            } else if character.description == " " {
                //pass
            } else {
                unit.append(character)
            }
        }

        guard let converted = Int.init(number) else {
            return "1 개"
        }

        if unit == "" {
            unit = "개"
        }

        return converted.description.appending(" ").appending(unit)
    }
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.pid == rhs.pid
    }
}
