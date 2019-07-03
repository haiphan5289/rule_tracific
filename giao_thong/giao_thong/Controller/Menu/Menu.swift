//
//  Menu.swift
//  giao_thong
//
//  Created by HaiPhan on 7/3/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class Menu: UIViewController {

    let indentifier = "Menu_cell"
    @IBOutlet weak var tb_menu: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tb_menu.delegate = self
        tb_menu.dataSource = self
        UIApplication.shared.statusBarStyle = .lightContent
        setup_view()
    }
    
    func setup_view(){
        tb_menu_autolayout()
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    func tb_menu_autolayout(){
        
        tb_menu.translatesAutoresizingMaskIntoConstraints = false
        tb_menu.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -20).isActive = true
        tb_menu.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tb_menu.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tb_menu.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0).isActive = true
    }

}
extension Menu: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb_menu.dequeueReusableCell(withIdentifier: "Menu_cell") as! Menu_cell
        let array_color = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.purple, UIColor.blue, UIColor.black, UIColor.brown, UIColor.orange]
        cell.backgroundColor = array_color[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screen = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "oto_controller")
//        navigationController?.pushViewController(screen, animated: true)
        present(screen, animated: true, completion: nil)
    }
    
    
}
