//
//  CustomUICollectionViewCell.swift
//  CiderHouseRestaurantWaiter
//
//  Created by mengjiao on 5/15/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//

import Foundation
import UIKit

class CustomUICollectionViewCell : UICollectionViewCell{
    
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:frame.width, height:frame.height))
        textLabel?.text = "nil"
        textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textLabel?.textAlignment = NSTextAlignment.center
        textLabel?.layer.cornerRadius  = 16
       // textLabel?.backgroundColor = #colorLiteral(red: 0.457623767, green: 0.8486875364, blue: 1, alpha: 1)
        //must set layer backgroundColor too change label shape .
        textLabel?.layer.backgroundColor = #colorLiteral(red: 0.457623767, green: 0.8486875364, blue: 1, alpha: 1)
     
     
        self.contentView.addSubview(textLabel!)
    }
    
}
