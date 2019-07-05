//
//  bien_bao_cell.swift
//  giao_thong
//
//  Created by HaiPhan on 7/5/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class bien_bao_cell: UICollectionViewCell {
    var text: UILabel!
    var img: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup_view()
        self.layer.borderColor = UIColor(red: 7/255, green: 25/255, blue: 30/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    func setup_view(){
        text_setup()
        img_setup_autolayout()
    }
    
    func img_setup_autolayout(){
        img = UIImageView()
//        img.image = UIImage(named: "d101")
        img.contentMode = .scaleAspectFit
        self.addSubview(img)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.bottomAnchor.constraint(equalTo: text.topAnchor, constant: -18).isActive = true
        img.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        img.widthAnchor.constraint(equalToConstant: self.frame.width - 32).isActive = true
    }
    
    func text_setup(){
        text = UILabel()
        text.text = "hihi"
        text.font = UIFont.boldSystemFont(ofSize: 16)
        text.textAlignment = .center
        self.addSubview(text)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        text.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        text.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
        text.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
