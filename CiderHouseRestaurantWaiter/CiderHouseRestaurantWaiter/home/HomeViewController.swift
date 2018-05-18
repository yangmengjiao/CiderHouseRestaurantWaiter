//
//  HomeViewController.swift
//  CiderHouseRestaurantWaiter
//
//  Created by mengjiao on 5/15/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//

import Foundation

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //var myCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width:80, height:80)
//        layout.sectionInset = UIEdgeInsetsMake(32, 32, 32, 32)
//        layout.headerReferenceSize = CGSize(width:100,height:30)
//        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    
    
        myCollectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        myCollectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
        
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "orderViewCtrl") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
        print("Num: \(indexPath.row)")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomUICollectionViewCell
        cell.textLabel?.text = "Table \(indexPath.row.description)"
        
        return cell
    }
    
}
