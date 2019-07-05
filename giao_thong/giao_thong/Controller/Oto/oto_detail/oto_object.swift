//
//  object_cell.swift
//  giao_thong
//
//  Created by HaiPhan on 7/3/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class oto_object: UITableViewCell {
    
    var title_obj: UILabel!
    var des: UITextView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "oto_object")
        //        self.backgroundColor = UIColor.blue
        setup_view()
        self.full_seperator()
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 0.2
    }
    
    func setup_view(){
        title_autolayout()
        des_autolayout()
    }
    var height_des: NSLayoutConstraint?
    func des_autolayout(){
        des = UITextView()
        //        des.text = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        des.textAlignment = .left
        des.font = UIFont.boldSystemFont(ofSize: 16)
        des.textColor = UIColor.darkGray
        des.isScrollEnabled = false
        des.isEditable = false
        self.addSubview(des)
        
        des.translatesAutoresizingMaskIntoConstraints = false
        des.leftAnchor.constraint(equalTo: title_obj.leftAnchor, constant: -4).isActive = true
        des.topAnchor.constraint(equalTo: title_obj.bottomAnchor, constant: -2).isActive = true
        des.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        height_des = des.heightAnchor.constraint(equalToConstant: 42)
        height_des!.isActive = true
    }
    
    func title_autolayout(){
        title_obj = UILabel()
        title_obj.text = "Đối tượng:"
        title_obj.font = UIFont.boldSystemFont(ofSize: 16)
        title_obj.textAlignment = .left
        //        title_obj.backgroundColor = UIColor.blue
        self.addSubview(title_obj)
        
        title_obj.translatesAutoresizingMaskIntoConstraints = false
        title_obj.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        title_obj.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        title_obj.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        title_obj.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
