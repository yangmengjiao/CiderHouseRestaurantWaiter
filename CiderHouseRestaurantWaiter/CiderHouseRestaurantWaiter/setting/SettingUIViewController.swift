//
//  SettingUIViewController.swift
//  CiderHouseRestaurantWaiter
//
//  Created by mengjiao on 5/15/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//

import Foundation
import UIKit

class SettingUIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var uiTableView: UITableView!
    private let myItems: NSArray = ["TEST1", "TEST2", "TEST3"]
    
    override func viewDidLoad() {
        self.navigationController?.title = "Setting"
        super.viewDidLoad()
    
        uiTableView.dataSource = self
        uiTableView.delegate = self
        self.view.addSubview(uiTableView)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Num: \(indexPath.row)")
        print("Value: \(myItems[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profilePhotoCell", for: indexPath as IndexPath)
            cell.isUserInteractionEnabled = false
            return cell
        }
        
       let cell = UITableViewCell(style: .value1, reuseIdentifier: "info")
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        cell.detailTextLabel?.text = "test"
        cell.imageView?.image = UIImage(named: "me")
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        }else{
            return 50
        }
    }
    
}
