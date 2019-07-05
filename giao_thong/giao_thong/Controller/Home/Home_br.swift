//
//  Home_br.swift
//  giao_thong
//
//  Created by HaiPhan on 7/4/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class Home_br: UIView {
    var tb_list: UITableView!
    let tb_list_cell = "cell"
    var array_menu: [menu] = [menu]()
    var array_text_menu = ["Home"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setup_view()
        tb_list.delegate = self
        tb_list.dataSource = self
        tb_list.register(Home_br_cell.self, forCellReuseIdentifier: tb_list_cell)

    }
    
    func setup_view(){
        tb_list_setup_autolayout()
        get_data_json()
    }
    
    func get_data_json(){
        api_service.share.get_data_menu { (array_temp) -> [menu] in
            self.array_menu = array_temp
            self.tb_list.reloadData()
            return self.array_menu
        }
    }
    
    func tb_list_setup_autolayout(){
        tb_list = UITableView()
        tb_list.frame = CGRect(x: 0, y: -20, width:self.frame.width , height: self.frame.height + 20)
        tb_list.backgroundColor = UIColor.white
        self.addSubview(tb_list)
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getCurrentViewController() -> UIViewController? {
        
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil
        
    }
    
}
extension Home_br: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array_menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tb_list_cell) as! Home_br_cell
        let array_color = [UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1),
                           UIColor(red: 213/255, green: 113/255, blue: 37/255, alpha: 1),
                           UIColor(red: 56/255, green: 131/255, blue: 63/255, alpha: 1),
                           UIColor.purple,
                           UIColor(red: 61/255, green: 91/255, blue: 161/255, alpha: 1),
                           UIColor(red: 172/255, green: 205/255, blue: 213/255, alpha: 1),
                           UIColor(red: 7/255, green: 25/255, blue: 30/255, alpha: 1),
                           UIColor(red: 203/255, green: 18/255, blue: 191/255, alpha: 1)]
        let menu_detail = array_menu[indexPath.row]
        cell.backgroundColor = array_color[indexPath.row]
        cell.menu_cell = menu_detail

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let screen = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
//        let transition = CATransition()
//        transition.duration = 0.5
//        //        transition.type = CATransitionType.
//        //        transition.subtype = CATransitionSubtype.fromLeft
//        //        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
//        self.window!.layer.add(transition, forKey: kCATransition)
//        let storyboard: UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
//        let vc: oto_controller = storyboard.instantiateViewController(withIdentifier: "oto_controller") as! oto_controller
//        vc.modalTransitionStyle = .flipHorizontal
//        let currentController = self.getCurrentViewController()
//        currentController?.present(vc, animated: false, completion: nil)
        

        let vc = bien_bao()
        let currentController = self.getCurrentViewController()
        vc.modalTransitionStyle = .flipHorizontal
        currentController?.present(vc, animated: false, completion: nil)
        
//                let vc = hot_line()
//                let currentController = self.getCurrentViewController()
//                vc.modalTransitionStyle = .flipHorizontal
//                currentController?.present(vc, animated: false, completion: nil)

        
    }
    
}
