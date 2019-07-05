//
//  Home_cell.swift
//  giao_thong
//
//  Created by HaiPhan on 7/2/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class Home_cell: UITableViewCell {

//    @IBOutlet weak var image_cell_home: UIImageView!
    var image_cell_home: UIImageView!
//    @IBOutlet weak var title_home_cell: UILabel!
    var title_home_cell: UILabel!
//    @IBOutlet weak var price_home_cell: UILabel!
    var price_home_cell: UILabel!
//    @IBOutlet weak var text_view_home_cell: UILabel!
    var text_view_home_cell: UILabel!
    var rule_delegate: rule? {
        didSet {
            guard let txt_price = rule_delegate?.price, let img_text = rule_delegate?.img else {
                return
            }
            self.title_home_cell.text = rule_delegate?.title
            self.text_view_home_cell.text = rule_delegate?.des
            self.price_home_cell.text = "\(txt_price)"
            self.image_cell_home.image = UIImage(named:img_text)

        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: indentifier)
        imlement_code()
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
    func imlement_code(){
        image_cell_home_setup_autolayout()
        title_home_cell_setup_autolayout()
        text_view_home_cell_setup_autolayout()
        price_home_cell_setup_autolayout()
//        get_data_rutle_from_home()
    }
    
    //setup - price
    func price_home_cell_setup_autolayout(){
//        price_home_cell.backgroundColor = UIColor.red
        price_home_cell = UILabel()
        price_home_cell.font = UIFont.boldSystemFont(ofSize: 20)
        price_home_cell.textColor = UIColor.orange
//        price_home_cell.text = "hihi"
        self.addSubview(price_home_cell)
        
        price_home_cell.translatesAutoresizingMaskIntoConstraints = false
        price_home_cell.topAnchor.constraint(equalTo: text_view_home_cell.bottomAnchor, constant: 4).isActive = true
        price_home_cell.leftAnchor.constraint(equalTo: image_cell_home.rightAnchor, constant: 8).isActive = true
        price_home_cell.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        price_home_cell.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    //setup - textview
    func text_view_home_cell_setup_autolayout(){
//        text_view_home_cell.backgroundColor = UIColor.yellow
        text_view_home_cell = UILabel()
        text_view_home_cell.font = UIFont.boldSystemFont(ofSize: 12)
        text_view_home_cell.textColor = UIColor.darkGray
        text_view_home_cell.numberOfLines = 2
//        text_view_home_cell.isEditable = false
        self.addSubview(text_view_home_cell)
        
        text_view_home_cell.translatesAutoresizingMaskIntoConstraints = false
        text_view_home_cell.topAnchor.constraint(equalTo: title_home_cell.bottomAnchor, constant: 4).isActive = true
        text_view_home_cell.leftAnchor.constraint(equalTo: image_cell_home.rightAnchor, constant: 8).isActive = true
        text_view_home_cell.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        text_view_home_cell.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    //setup - autoayout title
    func title_home_cell_setup_autolayout(){
//        title_home_cell.backgroundColor = UIColor.green
        title_home_cell = UILabel()
        title_home_cell.font = UIFont.boldSystemFont(ofSize: 20)
        title_home_cell.textColor = UIColor.black
        self.addSubview(title_home_cell)
        
        title_home_cell.translatesAutoresizingMaskIntoConstraints = false
        title_home_cell.topAnchor.constraint(equalTo: image_cell_home.topAnchor, constant: 0).isActive = true
        title_home_cell.leftAnchor.constraint(equalTo: image_cell_home.rightAnchor, constant: 8).isActive = true
        title_home_cell.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        title_home_cell.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    //setup - autolayout image
    func image_cell_home_setup_autolayout(){
//        image_cell_home.backgroundColor = UIColor.blue
        image_cell_home = UIImageView()
        image_cell_home.skin()
        self.addSubview(image_cell_home)
        
        image_cell_home.translatesAutoresizingMaskIntoConstraints = false
        image_cell_home.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        image_cell_home.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        image_cell_home.heightAnchor.constraint(equalToConstant: 84).isActive = true
        image_cell_home.widthAnchor.constraint(equalToConstant: 84).isActive = true
    }
    

    
}
