//
//  CustomCell.swift
//  TestButtonInCell
//
//  Created by mengjiao on 5/17/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//

import UIKit
import MIOButtonFramework

class CustomOrderMealTabelViewCell: UITableViewCell,MIOButtonDelegate {
    func numberButtonResult(_ numberButton: MIOButton, number: String) {
        print(number)
        if number != "0" {
            orderNumberButton.borderColor(UIColor.red)
        }else{
            orderNumberButton.borderColor(UIColor.gray)
        }
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    @IBOutlet weak var orderNumberButton: MIOButton!
  
    
    
    
    override func awakeFromNib() {
        //  contentView.isUserInteractionEnabled = false
        super.awakeFromNib()
        
        layoutSubviews()
        setNeedsLayout()
       
         orderNumberButton.shakeAnimation = true
        orderNumberButton.awakeFromNib()// very very important!!!
        self.orderNumberButton.maxValue  = 5
        self.orderNumberButton.minValue = 0
        
        orderNumberButton.borderColor(UIColor.gray)
       // orderNumberButton.miDelegate = self
     //   self.orderNumberButton.aa = self
        
      //   orderNumberButton.borderColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
//        orderNumberButton.numberResult { (number) in
//            print(number)
//        }
        self.orderNumberButton.delegate = self
        
    }
    

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
       
       
       
    }
    
    
    @IBAction func touchBtn(_ sender: Any) {
        print("touch")
    }
}
