//
//  Home.swift
//  giao_thong
//
//  Created by HaiPhan on 7/2/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

let indentifier = "Home_cell"
class Home: UITableViewController {

    @IBOutlet weak var menu_bar: UIBarButtonItem!
    var search_view_home: search_view!
    var array_rule: [rule] = [rule]()
    @IBOutlet var tb_home: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imlement_code()
        tb_home.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        tb_home.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        let model = model_rule()
        array_rule = model.create_rule()

    }
    
    func imlement_code(){
        menu_bar_setup()
        navigation_bar_setup()
        seach_view_setup()
    }
    
    
    func seach_view_setup(){
        search_view_home = search_view()
//        search_view_home.backgroundColor = UIColor.cyan
//        search_view.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        view.addSubview(search_view_home)
        search_view_home.translatesAutoresizingMaskIntoConstraints = false
        search_view_home.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        search_view_home.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        search_view_home.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        search_view_home.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    //setup navigation bar
    func navigation_bar_setup(){
        UIApplication.shared.statusBarStyle = .lightContent

        //setup navigation bar
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.topItem?.title = "Xử phạt giao thông"
        
        //remove border
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    //setup menu bar
    func menu_bar_setup(){
//        menu_bar.title = "hihi"
        menu_bar.image = UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal)
        menu_bar.target = self.revealViewController()
        menu_bar.action = #selector(self.revealViewController().revealToggle(_:))
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        //chỉnh lại width của left menu
        self.revealViewController()?.rearViewRevealWidth = 100
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array_rule.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath) as! Home_cell
        cell.rule_delegate = array_rule[indexPath.row]
        cell.imlement_code()

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
