//
//  Home_br_cell.swift
//  giao_thong
//
//  Created by HaiPhan on 7/4/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class Home_br_cell: UITableViewCell {
    var menu_cell: menu? {
        didSet {
            self.img.image = UIImage(named: menu_cell!.img)?.withRenderingMode(.alwaysTemplate)
            self.img.tintColor = UIColor.white
            self.sub_text.text = menu_cell?.sub_title
        }
    }
    var img: UIImageView!
    var sub_text: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")
        setup_view()
    }
    
    func setup_view(){
        img_setup_autolayout()
        sub_text_autolayout()
    }
    
    func sub_text_autolayout(){
        sub_text = UILabel()
        sub_text.text = "Thanh Hải"
        sub_text.font = UIFont.boldSystemFont(ofSize: 12)
        sub_text.textColor = UIColor.white
        sub_text.textAlignment = .center
        
        self.addSubview(sub_text)
        
        sub_text.translatesAutoresizingMaskIntoConstraints = false
        sub_text.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        sub_text.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        sub_text.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
        sub_text.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func img_setup_autolayout(){
        img = UIImageView()
        img.image = UIImage(named: "motorbike")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = UIColor.white
        img.contentMode = .scaleAspectFill
        self.addSubview(img)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        img.widthAnchor.constraint(equalToConstant: 50).isActive = true
        img.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
