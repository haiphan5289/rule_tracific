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
    var price: String!
    init(img: String, title: String, des: String, price: String ) {
        self.img = img
        self.title = title
        self.des = des
        self.price = price
    }
}

class model_rule {
    func create_rule() ->[rule] {
        var array_rule_temp: [rule] = [rule]()
        
        let rule1: rule = rule(img: "search", title: "AAAAAAAAAA", des: "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", price: "10")
        let rule2: rule = rule(img: "search", title: "BBBBBBBBBBb", des: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", price: "10")
        
        array_rule_temp.append(rule1)
        array_rule_temp.append(rule2)
        
        return array_rule_temp
    }
}

class menu {
    var img: String!
    var sub_title: String
    init(img: String, sub_title: String) {
        self.img = img
        self.sub_title = sub_title
    }
}

class bien_bao_object {
    var img: String!
    var text: String!
    init(img: String, text: String) {
        self.img = img
        self.text = text
    }
}

class model_bien_bao {
    func create_bien_bao() -> [bien_bao_object]{
        var array_temp: [bien_bao_object] = [bien_bao_object]()
        
        let bien1: bien_bao_object = bien_bao_object(img: "d101", text: "Đường cấm")
        let bien2: bien_bao_object = bien_bao_object(img: "d102", text: "Cấm đi ngược chiều")
        array_temp.append(bien1)
        array_temp.append(bien2)
        
        return array_temp
    }
}

class phone {
    var title: String!
    var sub: String!
    init(title: String, sub: String) {
        self.title = title
        self.sub = sub
    }
}
