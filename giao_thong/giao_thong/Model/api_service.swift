//
//  api_service.swift
//  giao_thong
//
//  Created by HaiPhan on 7/3/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class api_service {
    static let share = api_service()
    func get_data_home(completion: ([rule]) -> [rule]){
        var array_json = [rule]()
        get_data_json(text: "Home") { (array_data) -> [rule] in
            array_json = array_data
            return array_json
        }
        completion(array_json)
    }
//        get_data_json { (array_data) -> [rule] in
//            array_json = array_data
//            return array_json
//        }
//        return array_json
//        var array_json = [rule]()
//        let path = Bundle.main.path(forResource: "Home", ofType:"json")
//        let url = URL(fileURLWithPath: path!)
//        do {
//            let data = try Data(contentsOf: url, options: .mappedIfSafe)
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSArray
//                //cách 1
//                for i in json as! [[String:Any]]{
//                    //                    let text: String = (i as! NSDictionary).value(forKey: "des") as! String
//                    let title = i["title"] as! String
//                    let des = i["des"] as! String
//                    let price = i["price"] as! Int
//                    let img = i["img"] as! String
//                    let data_json: rule = rule(img: img, title: title, des: des, price: price)
//                    array_json.append(data_json)
//                }
//
//            }catch let err as NSError {
//                print(err)
//            }
//
//        } catch let err as NSError {
//            print(err)
//        }
//        return array_json

    func get_data_json(text: String,  completion: ([rule]) -> [rule]){
        var array_json = [rule]()
        let path = Bundle.main.path(forResource: text, ofType:"json")
        let url = URL(fileURLWithPath: path!)
        do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSArray
                //cách 1
                for i in json as! [[String:Any]]{
                    //                    let text: String = (i as! NSDictionary).value(forKey: "des") as! String
                    let title = i["title"] as! String
                    let des = i["des"] as! String
                    let price = i["price"] as! String
                    let img = i["img"] as! String
                    let data_json: rule = rule(img: img, title: title, des: des, price: price)
                    array_json.append(data_json)
                    completion(array_json)
                }
                
            }catch let err as NSError {
                print(err)
            }
            
        } catch let err as NSError {
            print(err)
        }
    }
}
