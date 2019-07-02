//
//  giaothong.swift
//  giao_thong
//
//  Created by HaiPhan on 7/2/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class rule {
    var img: String!
    var title: String!
    var des: String
    var price: Int!
    init(img: String, title: String, des: String, price: Int ) {
        self.img = img
        self.title = title
        self.des = des
        self.price = price
    }
}

class model_rule {
    func create_rule() ->[rule] {
        var array_rule_temp: [rule] = [rule]()
        
        let rule1: rule = rule(img: "search", title: "AAAAAAAAAA", des: "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: 10)
        let rule2: rule = rule(img: "search", title: "BBBBBBBBBBb", des: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", price: 10)
        
        array_rule_temp.append(rule1)
        array_rule_temp.append(rule2)
        
        return array_rule_temp
    }
}
