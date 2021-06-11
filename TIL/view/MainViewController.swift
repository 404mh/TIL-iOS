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
    
    lazy var diary: [Post] = {
        var postList = [Post]()
        return postList
    }()
    
    var ref: DatabaseReference = Database.database().reference()
    // Navbar custom 필요
    @IBOutlet weak var mypageButton: UIBarButtonItem!
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var writeButton: UIButton!
    
    override func viewDidLoad() {
        updateData()
        super.viewDidLoad()
        
        self.title = "TIL"
        inputField.backgroundColor = .systemPurple
        writeButton.setTitle("작성하기", for: .normal)
        
        
    }
    
    @IBAction func writePost(_ sender: Any) {
        
        DispatchQueue.main.async(execute: {
            self.ref = Database.database().reference()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd-kk:mm:ss"
            let dateString = formatter.string(from: Date())
            
            var dic = [String: String]()
            
            dic["\(dateString)"] = self.inputField.text
            
            self.ref.child("Diary").child("user").child("date").child(dateString).setValue(dic)
           
//            child("text").setValue(self.inputField.text)
            
            self.inputField.text = ""
            
        })
        
    }
    
  
    
    func updateData() {
        
    }
}
