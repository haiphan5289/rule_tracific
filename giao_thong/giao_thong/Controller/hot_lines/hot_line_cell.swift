//
//  hot_line_cell.swift
//  giao_thong
//
//  Created by HaiPhan on 7/5/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class hot_line_cell: UICollectionViewCell {
    var title: UILabel!
    var img: UIImageView!
    var sub_title: UILabel!
    var phone_button: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 1
        setup_view()
    }
    
    func setup_view(){
        img_setup_autolayout()
        text_title_Setup()
        sub_title_setup_autolayout()
        phone_button_setup_autolayout()
    }
    
    func phone_button_setup_autolayout(){
        phone_button = UIButton(type: .custom)
        phone_button.setImage(UIImage(named: "call"), for: .normal)
        self.addSubview(phone_button)
        
        phone_button.translatesAutoresizingMaskIntoConstraints = false
        phone_button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        phone_button.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        phone_button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        phone_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func sub_title_setup_autolayout(){
        sub_title = UILabel()
        sub_title.text = "BBB"
        sub_title.font = UIFont.init(name: "SFUIDisplayRegular", size: 16)
        self.addSubview(sub_title)
        
        sub_title.translatesAutoresizingMaskIntoConstraints = false
        sub_title.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 8).isActive = true
        sub_title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        sub_title.bottomAnchor.constraint(equalTo: img.bottomAnchor, constant: 4).isActive = true
        sub_title.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func text_title_Setup(){
        title = UILabel()
        title.text = "AA"
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textAlignment = .left
//        title.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        self.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: img.rightAnchor, constant: 8).isActive = true
        title.topAnchor.constraint(equalTo: img.topAnchor, constant: -3).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    func img_setup_autolayout(){
        img = UIImageView()
        img.image = UIImage(named: "duongdaynong")
        img.contentMode = .scaleToFill
        self.addSubview(img)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        img.widthAnchor.constraint(equalToConstant: 40).isActive = true
        img.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
