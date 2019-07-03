//
//  search_view.swift
//  giao_thong
//
//  Created by HaiPhan on 7/2/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class search_view: UIView {
    var txt_search: UITextField!
    var img_search: UIImageView!
    var view_container: UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.frame = CGRect(x: 0, y: -50, width: self.frame.width , height: 50)
        backgroundColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        setup_view()
    }
    
    func setup_view(){
        view_setup_autolayout()
        img_search_autolayout()
        txt_search_autolayout()
    }
    
    //setup - img search
    func img_search_autolayout(){
        img_search = UIImageView()
        img_search.image = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        img_search.tintColor = UIColor.black
        view_container.addSubview(img_search)
        
        img_search.translatesAutoresizingMaskIntoConstraints = false
        img_search.leftAnchor.constraint(equalTo: view_container.leftAnchor, constant: 8).isActive = true
        img_search.centerYAnchor.constraint(equalTo: view_container.centerYAnchor, constant: 0).isActive = true
        img_search.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img_search.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    //setup txt search
    func txt_search_autolayout(){
        txt_search = UITextField()
        txt_search.placeholder = "Enter your text...."
        txt_search.textColor = UIColor(red: 194/255, green: 31/255, blue: 31/255, alpha: 1)
        view_container.addSubview(txt_search)
        
        txt_search.translatesAutoresizingMaskIntoConstraints = false
        txt_search.leftAnchor.constraint(equalTo: img_search.rightAnchor, constant: 8).isActive = true
        txt_search.topAnchor.constraint(equalTo: view_container.topAnchor, constant: 0).isActive = true
        txt_search.rightAnchor.constraint(equalTo: view_container.rightAnchor, constant: 0).isActive = true
        txt_search.heightAnchor.constraint(equalTo: view_container.heightAnchor, constant: 0).isActive = true
    }
    
    //setup- view
    func view_setup_autolayout(){
        view_container = UIView()
        view_container.backgroundColor = UIColor.white
        view_container.layer.cornerRadius = 5
        self.addSubview(view_container)
        
        view_container.translatesAutoresizingMaskIntoConstraints = false
        view_container.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        view_container.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        view_container.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        view_container.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
