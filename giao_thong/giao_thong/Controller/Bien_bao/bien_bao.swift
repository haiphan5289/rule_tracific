//
//  bien_bao.swift
//  giao_thong
//
//  Created by HaiPhan on 7/4/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class bien_bao: UIViewController {
    var navi_bar: UINavigationBar!
    var search: UISearchBar!
    var bien_bao_collect: UICollectionView!
    let CellWithReuseIdentifier = "cell"
    var array_bien_bao: [bien_bao_object] = [bien_bao_object]()
    var filter_array: [bien_bao_object] = [bien_bao_object]()
    var isSearching: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
        implement_code()
        bien_bao_collect.delegate = self
        bien_bao_collect.dataSource = self
        bien_bao_collect.register(bien_bao_cell.self, forCellWithReuseIdentifier: "cell")
        bien_bao_collect.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        search.delegate = self
//        let model = model_bien_bao()
//        array_bien_bao = model.create_bien_bao()
        
    }
    
    func implement_code(){
        navi_bar_setup_autolayout()
        search_autolayout()
        bien_bao_autolayout()
        get_data_bien_bao()
    }
    
    func get_data_bien_bao(){
        api_service.share.get_data_bien_bao { (array_json) -> [bien_bao_object] in
            self.array_bien_bao = array_json
            self.bien_bao_collect.reloadData()
            return self.array_bien_bao
        }
    }
    
    func bien_bao_autolayout(){
        //lúc nào cũng sai cái này
        //nhớ rõ
        //tên hàm phải chính xác
//        let layout = UICollectionViewLayout()
        let layout = UICollectionViewFlowLayout()
        bien_bao_collect = UICollectionView(frame: .zero, collectionViewLayout: layout)
        bien_bao_collect.backgroundColor = UIColor.white
        view.addSubview(bien_bao_collect)
        
        bien_bao_collect.translatesAutoresizingMaskIntoConstraints = false
        bien_bao_collect.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        bien_bao_collect.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 0).isActive = true
        bien_bao_collect.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        bien_bao_collect.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    func search_autolayout(){
        search = UISearchBar()
        search.barTintColor = UIColor(red: 61/255, green: 91/255, blue: 171/255, alpha: 1)
        search.layer.borderColor = UIColor(red: 61/255, green: 91/255, blue: 171/255, alpha: 1).cgColor
        search.layer.borderWidth = 5
        search.placeholder = "Nhập biển báo cần tìm..."
        self.view.addSubview(search)
        
        search.translatesAutoresizingMaskIntoConstraints = false
        search.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        search.topAnchor.constraint(equalTo: navi_bar.bottomAnchor, constant: 0).isActive = true
        search.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        search.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func navi_bar_setup_autolayout(){
        navi_bar = UINavigationBar()
        let position_y = UIApplication.shared.statusBarFrame.height
//        DispatchQueue.main.async {
////            self.imageView.image = image
//            self.navi_bar.frame = CGRect(x: 10, y: position_y, width: self.view.frame.width, height: 44)
//        }
        self.view.addSubview(navi_bar)
        
        navi_bar.translatesAutoresizingMaskIntoConstraints = false
        navi_bar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        navi_bar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: position_y).isActive = true
        navi_bar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        navi_bar.heightAnchor.constraint(equalToConstant: 44).isActive = true

        //setup properties
        let navi_item: UINavigationItem = UINavigationItem(title: "Biển báo giao thông")
        let left_button: UIButton = UIButton(type: .custom)
        left_button.setImage(UIImage(named: "menu"), for: .normal)
        navi_item.leftBarButtonItem = UIBarButtonItem(customView: left_button)
        navi_bar.setItems([navi_item], animated: true)
        
        //setup status bar & navibar
        UIApplication.shared.statusBarStyle = .lightContent
        
        navi_bar.isTranslucent = false
        navi_bar.barTintColor = UIColor(red: 51/255, green: 91/255, blue: 161/255, alpha: 1)
        navi_bar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        
        let view_status = UIView(frame: CGRect(x: 0, y: 0, width: UIApplication.shared.statusBarFrame.width, height: UIApplication.shared.statusBarFrame.height))
        view_status.backgroundColor = UIColor(red: 51/255, green: 91/255, blue: 161/255, alpha: 1)
        self.view.addSubview(view_status)

    }


}
extension bien_bao: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return filter_array.count
        }
        return array_bien_bao.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bien_bao_collect.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! bien_bao_cell
        if isSearching {
            let bien_bao_detail = filter_array[indexPath.row]
            cell.text.text = bien_bao_detail.text
            cell.img.image = UIImage(named: bien_bao_detail.img)
            return cell
        }
        else {
            let bien_bao_detail = array_bien_bao[indexPath.row]
            cell.text.text = bien_bao_detail.text
            cell.img.image = UIImage(named: bien_bao_detail.img)
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width - 32 ) / 2
        return CGSize(width: width , height: width)
    }
    
    
}
extension bien_bao: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filter_array = array_bien_bao
            self.bien_bao_collect.reloadData()
        }
        else {
            filter_array = array_bien_bao.filter({ $0.text.lowercased().contains(searchText.lowercased()) })
            isSearching = true
            self.bien_bao_collect.reloadData()
        }

    }
}
