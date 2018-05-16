//
//  OrderViewController.swift
//  CiderHouseRestaurantWaiter
//
//  Created by mengjiao on 5/16/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//
import Foundation
import MIOButtonFramework
class OrderViewController: ViewController {
 
    
    @IBOutlet weak var numberButton: MIOButton!
    override func viewDidLoad() {
        numberButton.shakeAnimation = true
        numberButton.borderColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        numberButton.maxValue = 10
        numberButton.minValue = 0
        numberButton.numberResult { (number) in

            print(number)
        }
            }
}
