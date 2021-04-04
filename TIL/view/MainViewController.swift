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
    var posts = [Post]()
    var idx = 1
    // Navbar custom 필요
    @IBOutlet weak var mypageButton: UIBarButtonItem!
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var yilField: UILabel!
    @IBOutlet weak var writeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "TIL"
        inputField.backgroundColor = .systemPurple
        writeButton.setTitle("작성하기", for: .normal)
        yilField.text = "YIL"
    }

    @IBAction func writePost(_ sender: Any) {
        self.ref = Database.database().reference()
            
        DispatchQueue.main.async(execute: {
            self.ref = Database.database().reference()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dateString = formatter.string(from: Date())
            
            self.ref.child("Diary").child(dateString).child(String(self.idx)).setValue(self.inputField?.text)
            
            self.inputField.text = ""
            self.idx += 1
        })
    }
    
}
