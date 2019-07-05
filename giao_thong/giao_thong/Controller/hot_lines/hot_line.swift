//
//  hot_line.swift
//  giao_thong
//
//  Created by HaiPhan on 7/5/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class hot_line: UIViewController {
    var navi_bar: UINavigationBar!
    var search: UISearchBar!
    var list_collect: UICollectionView!
    var array_sdt: [phone]  = [phone]()
    var array_filter: [phone]  = [phone]()
    var isSearching: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        imlement_code()
        self.view.backgroundColor = UIColor.white

    }
    
    func imlement_code(){
        navi_bar_setup_autolayout()
        search_autolayout()
        list_collect_autolayout()
        get_data_json()
    }
    
    func get_data_json(){
        api_service.share.get_data_phone { (array_json) -> [phone] in
            self.array_sdt = array_json
            self.list_collect.reloadData()
            return self.array_sdt
        }
    }
    
    func list_collect_autolayout(){
        let layout = UICollectionViewFlowLayout()
        list_collect = UICollectionView(frame: .zero, collectionViewLayout: layout)
        list_collect.backgroundColor = UIColor.white
        self.view.addSubview(list_collect)
        
        list_collect.translatesAutoresizingMaskIntoConstraints = false
        list_collect.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        list_collect.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 0).isActive = true
        list_collect.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        list_collect.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        list_collect.register(hot_line_cell.self, forCellWithReuseIdentifier: "cell")
        list_collect.delegate = self
        list_collect.dataSource = self
        list_collect.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        
        
    }
    
    func search_autolayout(){
        search = UISearchBar()
        search.placeholder = "Nhập sdt cần tìm...."
        search.barTintColor =  UIColor(red: 7/255, green: 25/255, blue: 30/255, alpha: 1)
        self.view.addSubview(search)
        
        search.translatesAutoresizingMaskIntoConstraints = false
        search.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        search.topAnchor.constraint(equalTo: navi_bar.bottomAnchor, constant: 0).isActive = true
        search.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        search.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        search.delegate = self
    }
    
    func navi_bar_setup_autolayout(){
        navi_bar = UINavigationBar()
        navi_bar.frame = CGRect(x: 0, y: UIApplication.shared.statusBarFrame.height, width: self.view.frame.width, height: 44)
        self.view.addSubview(navi_bar)
        
        let navi_item: UINavigationItem = UINavigationItem(title: "Đường dây nóng")
        let left_buttion: UIButton = UIButton(type: .custom)
        left_buttion.setImage(UIImage(named: "menu"), for: .normal)
        navi_item.leftBarButtonItem = UIBarButtonItem(customView: left_buttion)
        navi_bar.setItems([navi_item], animated: true)
        
        UIApplication.shared.statusBarStyle = .lightContent
        navi_bar.isTranslucent = false
        navi_bar.barTintColor = UIColor(red: 7/255, green: 25/255, blue: 30/255, alpha: 1)
        navi_bar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
        
        let view_status = UIView()
        view_status.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20)
        view_status.backgroundColor = UIColor(red: 7/255, green: 25/255, blue: 30/255, alpha: 1)
        self.view.addSubview(view_status)
        
        
    }


}
extension hot_line: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return array_filter.count
        }
        return array_sdt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = list_collect.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! hot_line_cell
        if isSearching {
            let sdt_detail = array_filter[indexPath.row]
            cell.title.text = sdt_detail.title
            cell.sub_title.text = sdt_detail.sub
            return cell
        }
        let sdt_detail = array_sdt[indexPath.row]
        cell.title.text = sdt_detail.title
        cell.sub_title.text = sdt_detail.sub
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 60)
    }
    
    
}
extension hot_line : UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String){
        if searchText.isEmpty {
            array_filter = array_sdt
            self.list_collect.reloadData()
        }
        else {
            array_filter = array_sdt.filter({ $0.title.lowercased().contains(searchText.lowercased()) || $0.sub.lowercased().contains(searchText.lowercased()) })
            isSearching = true
            self.list_collect.reloadData()
        }
    }
}
