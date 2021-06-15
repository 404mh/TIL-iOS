//
//  LoginViewController.swift
//  TIL
//
//  Created by exception on 2021/05/03.
//

import UIKit
import Foundation
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var githubLoginButton: UIButton!
    
    
    let clientID = "2d0caaa45eb1213f8bb6"
    let scope = "repo gist user"
    let urlString = "https://github.com/login/oauth/authorize"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func githubLogin(_ sender: Any) {
        var components = URLComponents(string: urlString)!
        
        components.queryItems = [
            URLQueryItem(name: "client_id", value: self.clientID),
            URLQueryItem(name: "scope", value: self.scope),
        ]
        
        guard let url = URL(string: urlString) else { return }
        
        UIApplication.shared.open(url)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
