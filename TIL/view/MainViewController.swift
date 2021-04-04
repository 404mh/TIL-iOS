//
//  MainViewController.swift
//  TIL
//
//  Created by exception on 2021/03/29.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class MainViewController: UIViewController {
    
    var ref: DatabaseReference!

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

    @IBAction func writePost(_ sender: Any) {
        self.ref = Database.database().reference()

        DispatchQueue.main.async(execute: {
            self.ref = Database.database().reference()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dateString = formatter.string(from: Date())
            
            self.ref.child("Diary").child(dateString).setValue(self.inputField.text)
        })
    }
    
}
