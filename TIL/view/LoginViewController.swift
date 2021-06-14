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
    
    var provider = OAuthProvider(providerID: "github.com")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func githubLogin(_ sender: Any) {
        
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
