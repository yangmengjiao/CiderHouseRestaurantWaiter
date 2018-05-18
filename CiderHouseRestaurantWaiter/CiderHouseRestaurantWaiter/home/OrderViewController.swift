//
//  OrderViewController.swift
//  CiderHouseRestaurantWaiter
//
//  Created by mengjiao on 5/16/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//
import Foundation
import MIOButtonFramework


    class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        @IBOutlet weak var table: UITableView!
        
        // Tableで使用する配列を設定する
        private let myItems: NSArray = ["TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3","TEST1", "TEST2", "TEST3"]
       
        private var myTableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.hidesBottomBarWhenPushed = true
            // Status Barの高さを取得する.
            let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
            
            // Viewの高さと幅を取得する.
            let displayWidth: CGFloat = self.view.frame.width
            let displayHeight: CGFloat = self.view.frame.height
            
            // TableViewの生成(Status barの高さをずらして表示).
            //   myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight))
            
            // Cell名の登録をおこなう.
            // myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
            
            // DataSourceを自身に設定する.
            table.dataSource = self
            
            // Delegateを自身に設定する.
            table.delegate = self
            
            // Viewに追加する.
            //   self.view.addSubview(myTableView)
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        /*
         Cellが選択された際に呼び出される
         */
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Num: \(indexPath.row)")
            print("Value: \(myItems[indexPath.row])")
            
        }
        
        /*
         Cellの総数を返す.
         */
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return myItems.count
        }
        
        /*
         Cellに値を設定する
         */
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // 再利用するCellを取得する.
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath) as! CustomOrderMealTabelViewCell
          //  cell.bringSubview(toFront: cell.orderNumberButton)
            // Cellに値を設定する.
          //  cell.textLabel!.text = "\(myItems[indexPath.row])"
            cell.selectionStyle = .none
            
            
            return cell
        }
        
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 44
//        }
}

//
//class OrderViewController: ViewController {
//
//
//    @IBOutlet weak var numberButton: MIOButton!
//    override func viewDidLoad() {
//        numberButton.shakeAnimation = true
//        numberButton.borderColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
//        numberButton.maxValue = 10
//        numberButton.minValue = 0
//        numberButton.numberResult { (number) in
//
//            print(number)
//        }
//            }
//}
