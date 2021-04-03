//
//  MainViewController.swift
//  TIL
//
//  Created by exception on 2021/03/29.
//

import UIKit

class MainViewController: UIViewController {
    
    // Navbar custom 필요
    
    
    @IBOutlet weak var mypageButton: UIBarButtonItem!
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var yilField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TIL"
        inputField.backgroundColor = .systemPurple
        
        yilField.text = "YIL"
    }


}
