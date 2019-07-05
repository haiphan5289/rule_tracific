//
//  Home_detail.swift
//  giao_thong
//
//  Created by HaiPhan on 7/3/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

let title_cell_text = "title"
let objec_cell_text = "object"
let des_text = "des"
let price_text = "price"

class Home_detail: UIViewController {

    var navi_bar: UINavigationBar!
    var tb_detail: UITableView!
    let indentifier = "Cell"
    let object = "object"
    var price : String!
    var rule_detail: rule!
    var array_detail: [Any] = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        price = String(rule_detail!.price)
        imlement_code()
        tb_detail.delegate = self
        tb_detail.dataSource = self
        tb_detail.separatorStyle = .none
        tb_detail.register(UITableViewCell.self, forCellReuseIdentifier: indentifier)
        tb_detail.register(title_cell.self, forCellReuseIdentifier: title_cell_text)
        tb_detail.register(object_cell.self, forCellReuseIdentifier: objec_cell_text)
        tb_detail.register(des_cell.self, forCellReuseIdentifier: des_text)
        tb_detail.register(price_cell.self, forCellReuseIdentifier: price_text)
        tb_detail.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        tb_detail.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)

    }

    func imlement_code(){
        navi_bar_setup_autolayout()
        navigation_setup()
        tb_detail_autolayout()
        create_detail()
    }
    //tạo 1 mảng detail gôm các thành phần detial
    func create_detail(){
        array_detail.append(rule_detail!.title)
        array_detail.append(object)
        array_detail.append(rule_detail.des)
        array_detail.append(price)

    }
    
    func navigation_setup(){
        UIApplication.shared.statusBarStyle = .lightContent
        
        //setup navigation bar
        navi_bar.isTranslucent = false
        navi_bar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        navi_bar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
//        navi_bar.tintColor = UIColor.white
        
        //remove border
       navi_bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
       navi_bar.shadowImage = UIImage()
        
        //remove text back button
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        //add view status bar
        let view_status = UIView()
        view_status.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: UIApplication.shared.statusBarFrame.height)
        view_status.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        view.addSubview(view_status)

    }
    //setup - navi bar
    func navi_bar_setup_autolayout(){
        navi_bar = UINavigationBar()
        navi_bar.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: self.view.frame.width, height: 44)
        self.view.addSubview(navi_bar)
        
        //add navigation item
        let naviitem: UINavigationItem = UINavigationItem(title: "My Chat")
        let back_button : UIButton = UIButton(type: .custom)
        
        //nó làm 1 cái hình mũi tên không có br nên không cần tincolor
        //Nếu xài tin color thì br cái hình phải cùng màu với back ground cha
        back_button.setImage(UIImage(named: "left_arrow"), for: .normal)
        back_button.addTarget(self, action: #selector(handle_navi), for: .touchUpInside)
//        back_button.tintColor = UIColor.black
        back_button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        naviitem.leftBarButtonItem = UIBarButtonItem(customView: back_button)
        navi_bar.setItems([naviitem], animated: true)
    }
    
    @objc func handle_navi(){
//        let screen = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
//        present(screen, animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    //setup - tb_detail
    func tb_detail_autolayout(){
        tb_detail = UITableView()
        self.view.addSubview(tb_detail)
        
        tb_detail.translatesAutoresizingMaskIntoConstraints = false
        tb_detail.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tb_detail.topAnchor.constraint(equalTo: navi_bar.bottomAnchor, constant: 0).isActive = true
        tb_detail.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        tb_detail.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }

}
extension Home_detail: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array_detail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element_detail = array_detail[indexPath.row] as! String
        if rule_detail.title == element_detail {
//            text_cell = title_cell_text
            let cell = tb_detail.dequeueReusableCell(withIdentifier: title_cell_text) as! title_cell
            cell.title.text = element_detail
            cell.img_title.image = UIImage(named: rule_detail.img)
            //setup cell ở đây khi scroll sẽ bị lỗi, bỏ vào class cell là hết lỗi
//            cell.layer.borderWidth = 0.2
//            cell.layer.backgroundColor = UIColor.darkGray.cgColor
//            cell.full_seperator()
            return cell
        }else if object == element_detail {
            let cell = tb_detail.dequeueReusableCell(withIdentifier: objec_cell_text) as! object_cell
            cell.des.text = element_detail
            let height = estimate_size_for_text(text: element_detail as! String).height
            cell.height_des!.constant = height + 20
            
//            cell.layer.borderWidth = 0.2
//            cell.layer.backgroundColor = UIColor.darkGray.cgColor
//            cell.full_seperator()
            return cell
        }else if rule_detail.des == element_detail {
            let cell = tb_detail.dequeueReusableCell(withIdentifier: des_text) as! des_cell
            cell.des.text = element_detail
            let height = estimate_size_for_text(text: element_detail as! String).height
            cell.height_des.constant = height + 20
            
//            cell.layer.borderWidth = 0.2
//            cell.layer.backgroundColor = UIColor.darkGray.cgColor
//            cell.full_seperator()
            return cell
        }else if price == element_detail {
            let cell = tb_detail.dequeueReusableCell(withIdentifier: price_text) as! price_cell
            cell.des.text = element_detail
            
//            cell.layer.borderWidth = 0.2
//            cell.layer.backgroundColor = UIColor.darkGray.cgColor
//            cell.full_seperator()
            return cell
        }
        else{
            let cell = tb_detail.dequeueReusableCell(withIdentifier: indentifier)
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //muốn tính height chính xác thì
        // 1: xác định chiều cao các element còn lại
        // 2: xác định chiều cao text
        // 3: Ở height text + 10 >>> 30
        let height = estimate_size_for_text(text: array_detail[indexPath.row] as! String).height
        if height > 37 {
            return height + 46
        }
        return 60
    }
    
    
    func estimate_size_for_text(text: String) -> CGRect {
        let size = CGSize(width: self.view.frame.width - 16, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: option, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)], context: nil)
    }
    
    
}
