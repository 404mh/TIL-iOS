//
//  MainViewController.swift
//  TIL
//
//  Created by exception on 2021/03/29.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var verticalCollectionView: UIView!
    
    lazy var diary: [Post] = {
        var postList = [Post]()
        return postList
    }()
    
    var ref: DatabaseReference = Database.database().reference()
    // Navbar custom 필요
    @IBOutlet weak var mypageButton: UIBarButtonItem!
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var yilField: UILabel!
    @IBOutlet weak var writeButton: UIButton!
    
    override func viewDidLoad() {
        updateData()
        super.viewDidLoad()
        
        self.title = "TIL"
        inputField.backgroundColor = .systemPurple
        writeButton.setTitle("작성하기", for: .normal)
        yilField.text = "YIL"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        verticalCollectionView.addSubview(collectionView)
        collectionView.frame = CGRect(x: 0, y: 0, width: self.verticalCollectionView.frame.width, height: self.verticalCollectionView.frame.height)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    @IBAction func writePost(_ sender: Any) {
        
        DispatchQueue.main.async(execute: {
            self.ref = Database.database().reference()
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd-kk:mm:ss"
            let dateString = formatter.string(from: Date())
            
            var dic = [String: String]()
            
            dic["\(dateString)"] = self.inputField.text
            
            self.ref.child("Diary").child("user").child(dateString).setValue(dic)
           
//            child("text").setValue(self.inputField.text)
            
            self.inputField.text = ""
            
        })
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.diary.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .cyan
        for subView in cell.subviews {
            subView.removeFromSuperview()
        }
        
        let label: UILabel = {
            let lblTxt = UILabel()
            lblTxt.text = "\(indexPath.row)"
            lblTxt.textAlignment = .center
            return lblTxt
        }()
        
        cell.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
        
        return cell
    }
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemGreen
        
        return cv
    }()
    
    func updateData() {
        ref.child("Diary").child("user").child("text").child("date").observe(.value, with: {(snapshot) in
            
            let values = snapshot.value as? [String: AnyObject] ?? [:]
            for element in values.values {
                print(element)
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                
            }
            
        })
    }
}
