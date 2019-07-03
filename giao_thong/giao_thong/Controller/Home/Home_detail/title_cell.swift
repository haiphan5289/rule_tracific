//
//  title_cell.swift
//  giao_thong
//
//  Created by HaiPhan on 7/3/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class title_cell: UITableViewCell {
//    var home_detail: String? {
//        didSet {
//            print("hihi")
//        }
//    }
    var img_title: UIImageView!
    var title: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: title_cell_text)
//        self.backgroundColor = UIColor.orange
        setup_view()
        self.full_seperator()
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.borderWidth = 0.2
    }
    
    func setup_view(){
        img_title_autolayout()
        title_autolayout()
    }
    
    func title_autolayout(){
        title = UILabel()
//        title.backgroundColor = UIColor.yellow
        title.text = "Check ádas da sda sd ád a sd ád á MGIsDeviceOneOfType is not supported on this platform."
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.numberOfLines = 2
        self.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: img_title.rightAnchor, constant: 8).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: -4).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        title.heightAnchor.constraint(equalToConstant: 74).isActive = true
        //1 line = 54
        //2 line = 74
    }
    
    func img_title_autolayout(){
        img_title = UIImageView()
//        img_title.image = UIImage(named: "search")
//        img_title.backgroundColor = UIColor.orange
        img_title.contentMode = .scaleAspectFit
        self.addSubview(img_title)
        
        img_title.translatesAutoresizingMaskIntoConstraints = false
        img_title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        img_title.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        img_title.widthAnchor.constraint(equalToConstant: 45).isActive = true
        img_title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
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
