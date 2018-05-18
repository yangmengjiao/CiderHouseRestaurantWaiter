//
//  LogInViewControlleraa.swift
//  CiderHouseRestaurantWaiter
//
//  Created by mengjiao on 5/14/18.
//  Copyright © 2018 mengjiao. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var accountView: UIView!
    var textFields: [UITextField] = []
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var name: UILabel!
    
    struct UserPost: Codable {
        let UserName: String
        let Password: String
    }

    
    @IBOutlet weak var passwordLabel: UILabel!
    override func viewDidLoad() {
        textFields.append(usernameTextField)
     hideKeyboardWhenTappedAround()
        
        accountView.layer.cornerRadius = 25
        accountView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        accountView.layer.borderWidth = 1
        accountView.backgroundColor = UIColor.clear
        
        passwordView.layer.cornerRadius = 25
        passwordView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        passwordView.layer.borderWidth = 1
        passwordView.backgroundColor = UIColor.clear
        
        loginButton.layer.cornerRadius = 25
        //self.errorLabel.isHidden = true
        self.navigationItem.title = "Login"
        usernameTextField.placeholder = "enter your account please"
       usernameTextField.borderStyle = .none
        usernameTextField.delegate = self
        
        passwordTextField.placeholder = "enter your password please"
        passwordTextField.borderStyle = .none
        passwordTextField.delegate = self
        name.text = "     Account"
        passwordLabel.text = "    Password"
        usernameTextField.backgroundColor = UIColor.clear
        name.backgroundColor = UIColor.clear
    }
    
    
    
    @IBAction func touchLoginButton(_ sender: Any) {
        self.performSegue(withIdentifier: "tabsSegue", sender: self)
        let account = usernameTextField.text
        let password = passwordTextField.text
//        login(with: UserPost(UserName: account!, Password: password!)) { (error) in
//            print(error?.localizedDescription)
//        }
        
        
        
//        let flag = loginBackend(username: account, password: password)
//        if flag {
//            //login success
//            self.performSegue(withIdentifier: "tabsSegue", sender: self)
//
//        }else{
//            errorLabel.isHidden = false
//            errorLabel.text = "account or password is not correct! "
//        }
    }
    
    private func loginBackend(username: String?, password: String?) -> Bool{
        return true
    }
    
    
    
    //post with parameter demo: login
    func login(with userpost: UserPost, completion:((Error?) -> Void)?) {
        
        guard let url = URLHelper.sharedInstance.getLoginURL() else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // will be JSON encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        //let's encode out Post struct into JSON data...
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(userpost)
            request.httpBody = jsonData
            let aa = String(data: request.httpBody!, encoding: .utf8)
            print("jsonData: ",aa ?? "no body data")
        } catch {
            completion?(error)
        }
        
        // Create and run a URLSession data task with our JSON encoded POST request
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else {
                completion?(responseError!)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    //todo :
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        self.performSegue(withIdentifier: "tabsSegue", sender: self)
//                        });
//                    DispatchQueue.sync(DispatchQueue.main){
//                        self.performSegue(withIdentifier: "tabsSegue", sender: self)
//                    }
                    DispatchQueue.main.sync {
                        self.performSegue(withIdentifier: "tabsSegue", sender: self)
                    }
                   
                }else{
                    DispatchQueue.main.async {
                        self.errorLabel.isHidden = false
                        self.errorLabel.text = "account or password is not correct! "
                    }
                   
                }
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                print("error \(httpResponse.statusCode)")
            }
            
            if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
                
                print("response: ", utf8Representation)
            } else {
                print("no readable data received in response")
            }
        }
        task.resume()
    }
    
    
}

extension LogInViewController:UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        //键盘收回，view放下
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.view.frame.origin.y = 0
            
        })
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //view弹起跟随键盘，高可根据自己定义
        UIView.animate(withDuration: 0.4, animations: {
            
            self.view.frame.origin.y = -120
            
        })
    }
    
    
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        let swip: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
      //  tap.cancelsTouchesInView = false
       // swip.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(swip)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
