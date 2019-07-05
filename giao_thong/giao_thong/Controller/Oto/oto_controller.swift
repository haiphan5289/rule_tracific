//
//  oto_controller.swift
//  giao_thong
//
//  Created by HaiPhan on 7/3/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

let oto_text = "cell"

class oto_controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //    @IBOutlet weak var seach: UISearchBar!
    //    @IBOutlet weak var menu_bar: UIBarButtonItem!
    var seach: UISearchBar!
    var navi_bar_home: UINavigationBar!
    var search_view_home: search_view!
    var array_rule: [rule] = [rule]()
    var home_vc : UIView!
    //    @IBOutlet var tb_home: UITableView!
    var tb_home: UITableView!
    var filter_array: [rule] = [rule]()
    //tạo 1 cờ để biết khi nào đang search
    var isSearching: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        imlement_code()
        tb_home.delegate = self
        tb_home.dataSource = self
        //        seach.delegate = self
        seach.delegate = self
        tb_home.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tb_home.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tb_home.register(oto_cell.self, forCellReuseIdentifier: oto_text)
        //        let model = model_rule()
        //        array_rule = model.create_rule()
        
    }
    
    func imlement_code(){
        menu_bar_setup()
        navigation_bar_setup()
        seach_bar_autolayout()
        tb_home_autolayout()
        //        seach_view_setup()
        get_data_from_json()
    }
    
    func get_data_from_json(){
        api_service.share.get_data_home { (array_json) -> [rule] in
            self.array_rule = array_json
            self.tb_home.reloadData()
            return self.array_rule
        }
        //        array_rule = api_service.share.get_data_home()
        //        self.tb_home.reloadData()
        //        array_rule = api_service.share.get_data_home()
        //        self.tb_home.reloadData()
        //        let path = Bundle.main.path(forResource: "Home", ofType:"json")
        //        let url = URL(fileURLWithPath: path!)
        //        do {
        //             let data = try Data(contentsOf: url, options: .mappedIfSafe)
        //            do {
        //                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSArray
        //                //cách 1
        //                for i in json as! [[String:Any]]{
        ////                    let text: String = (i as! NSDictionary).value(forKey: "des") as! String
        //                    let title = i["title"] as! String
        //                    let des = i["des"] as! String
        //                    let price = i["price"] as! Int
        //                    let img = i["img"] as! String
        //                    let data_json: rule = rule(img: img, title: title, des: des, price: price)
        //                    self.array_rule.append(data_json)
        //                    self.tb_home.reloadData()
        //                }
        //
        //            }catch let err as NSError {
        //                print(err)
        //            }
        //
        //        } catch let err as NSError {
        //            print(err)
        //        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        if let key_window = UIApplication.shared.keyWindow {
//            back_ground = UIView()
//            back_ground.backgroundColor = UIColor.black
//            back_ground.frame = CGRect(x: 0, y: 0, width: key_window.frame.width, height: key_window.frame.height)
//            back_ground.alpha = 0.5
//
//            //addgesture bg view
//            back_ground.isUserInteractionEnabled = true
//            back_ground.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoom_in)))
//
//            key_window.addSubview(back_ground)
//
//            //add tb_bg
//            //            position_x_list = -100
//            view_list = Home_br(frame: CGRect(x: -100, y: 0, width: 100, height: key_window.frame.height))
//            key_window.addSubview(view_list)
//
//            //move frame y
//            position_x = 0
//            viewDidLayoutSubviews()
//            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
//                self.position_x = 100
//                self.viewDidLayoutSubviews()
//                self.view_list.frame.origin.x = 0
//            }, completion: nil)
//        }
    }
    
    //setup - tb home
    func tb_home_autolayout(){
        tb_home = UITableView()
        self.view.addSubview(tb_home)
        
        tb_home.translatesAutoresizingMaskIntoConstraints = false
        tb_home.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tb_home.topAnchor.constraint(equalTo: seach.bottomAnchor, constant: 0).isActive = true
        tb_home.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        tb_home.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    //setup - seach bar
    func seach_bar_autolayout(){
        seach = UISearchBar()
        seach.barTintColor = UIColor(red: 230/255, green: 31/255, blue: 32/255, alpha: 1)
        seach.layer.borderColor = UIColor(red: 230/255, green: 31/255, blue: 32/255, alpha: 1).cgColor
        seach.layer.borderWidth = 10
        //        let textFieldInsideUISearchBar = seach.value(forKey: "searchField") as? UITextField
        //        textFieldInsideUISearchBar?.borderStyle = .roundedRect
        //        textFieldInsideUISearchBar?.backgroundColor = UIColor.black
        seach.placeholder = "Nhập lỗi bạn muốn tìm..."
        self.view.addSubview(seach)
        
        seach.translatesAutoresizingMaskIntoConstraints = false
        seach.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        seach.topAnchor.constraint(equalTo: navi_bar_home.bottomAnchor, constant: 0).isActive = true
        seach.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        seach.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //    func seach_view_setup(){
    //        search_view_home = search_view()
    //        search_view_home.backgroundColor = UIColor.cyan
    //        self.view.addSubview(search_view_home)
    //        search_view_home.translatesAutoresizingMaskIntoConstraints = false
    //        search_view_home.bottomAnchor.constraint(equalTo: navi_bar_home.topAnchor, constant: 0).isActive = true
    //        search_view_home.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
    //        search_view_home.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
    //        search_view_home.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    //        tb_home.translatesAutoresizingMaskIntoConstraints = false
    //        tb_home.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
    //        tb_home.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
    //        tb_home.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    //        tb_home.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    //    }
    
    //setup navigation bar
    func navigation_bar_setup(){
        UIApplication.shared.statusBarStyle = .lightContent
        
        //setup navigation bar
        navi_bar_home.isTranslucent = false
        navi_bar_home.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        navi_bar_home.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
        //set imge left button color
        navi_bar_home.tintColor = UIColor.white
        navi_bar_home.topItem?.title = "Xử phạt giao thông"
        
        //remove border
        navi_bar_home.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navi_bar_home.shadowImage = UIImage()
        
        //add view cho status bar
        let status_bar : UIView = UIView()
        status_bar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: UIApplication.shared.statusBarFrame.height)
        status_bar.backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        self.view.addSubview(status_bar)
        
        //        self.navigationController?.navigationBar.isTranslucent = false
        //        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        //        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
        //        self.navigationController?.navigationBar.topItem?.title = "Xử phạt giao thông"
        //
        //        //remove border
        //        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        //        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    
    //setup menu bar
    func menu_bar_setup(){
        //add navi bar
        let y = UIApplication.shared.statusBarFrame.height
        navi_bar_home = UINavigationBar(frame: CGRect(x: 0, y: y, width: self.view.frame.width, height: 44))
        self.view.addSubview(navi_bar_home)
        
        //add left bar button
        let navi_item: UINavigationItem!
        navi_item = UINavigationItem()
        let img : UIImageView = UIImageView()
        //alwaysTemplate tincolot của img mới wroj
        img.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        //        img.tintColor = UIColor.white
        let left_button: UIBarButtonItem!
        left_button = UIBarButtonItem(image: img.image, style: .plain, target: self, action: #selector(show_menu))
        navi_item.leftBarButtonItem = left_button
        navi_bar_home.setItems([navi_item], animated: true)
        
        //        menu_bar.title = "hihi"
        //        menu_bar.image = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
        //        menu_bar.target = self.revealViewController()
        //        menu_bar.action = #selector(self.revealViewController().revealToggle(_:))
        //        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        //        //chỉnh lại width của left menu
        //        self.revealViewController()?.rearViewRevealWidth = 100
    }
    
    var position_x: CGFloat = 0
    var back_ground: UIView!
    var view_list: UIView!
    //    var position_x_list: CGFloat!
    override func viewDidLayoutSubviews() {
        // view
        let x:CGFloat      = position_x
        let y: CGFloat = self.view.bounds.origin.y
        let width:CGFloat  = self.view.bounds.width
        let height:CGFloat = self.view.bounds.height
        let frame:CGRect   = CGRect(x: x, y: y, width: width, height: height)
        
        self.view.frame           = frame
        self.view.backgroundColor = UIColor.black
    }
    @objc func show_menu(){
        //không thể hoạt động với nhiều screen cùng hiển thị left menu
        //        left_button.target = self.revealViewController()
        //        left_button.action = #selector(self.revealViewController()?.revealToggle(_:))
        //        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        //        self.revealViewController()?.rearViewRevealWidth = 100
        if let key_window = UIApplication.shared.keyWindow {
            back_ground = UIView()
            back_ground.backgroundColor = UIColor.black
            back_ground.frame = CGRect(x: 0, y: 0, width: key_window.frame.width, height: key_window.frame.height)
            back_ground.alpha = 0.5
            
            //addgesture bg view
            back_ground.isUserInteractionEnabled = true
            back_ground.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoom_in)))
            
            key_window.addSubview(back_ground)
            
            //add tb_bg
            //            position_x_list = -100
            view_list = Home_br(frame: CGRect(x: -100, y: 0, width: 100, height: key_window.frame.height))
            key_window.addSubview(view_list)
            
            //move frame y
            position_x = 0
            viewDidLayoutSubviews()
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.position_x = 100
                self.viewDidLayoutSubviews()
                self.view_list.frame.origin.x = 0
            }, completion: nil)
        }
    }
    @objc func zoom_in(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.position_x = 0
            self.viewDidLayoutSubviews()
            self.back_ground.alpha = 0
            self.view_list.frame.origin.x = -100
            
        }) { (completion) in
            self.view_list.removeFromSuperview()
            self.back_ground.removeFromSuperview()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //kiểm tra nếu đang seach thì hiển thị mảng fillter
        if  isSearching {
            return filter_array.count
        } else {
            return array_rule.count
        }
        //        return array_rule.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb_home.dequeueReusableCell(withIdentifier: oto_text, for: indexPath) as! oto_cell
        //kiểm tra nếu đang seach thì hiển thị mảng fillter
        if isSearching {
            cell.rule_delegate = filter_array[indexPath.row]
            cell.imlement_code()
            return cell
        }
        else {
            cell.rule_delegate = array_rule[indexPath.row]
            cell.imlement_code()
            return cell
        }
        //                    cell.rule_delegate = array_rule[indexPath.row]
        //                    cell.imlement_code()
        //                    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screen = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "oto_detail") as! oto_detail
        screen.rule_detail = array_rule[indexPath.row]
        present(screen, animated: true, completion: nil)
    }
    
    
}
extension oto_controller: UISearchBarDelegate {
    //khi user tap vào search se tạo ra 1 mảng fillter
    //nếu k nhập thì fillter = array
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter_array = array_rule.filter({ $0.title.prefix(searchText.count) == searchText })
        isSearching = true
        self.tb_home.reloadData()
    }
}
