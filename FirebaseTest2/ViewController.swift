//
//  ViewController.swift
//  FirebaseTest2
//
//  Created by 藤田優作 on 2020/11/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var dataView: UITextView!
    
    var db:Firestore!
    var people:CollectionReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.db = Firestore.firestore()
        self.people = db.collection("people")
        self.people.getDocuments(){(querySnapshot, err) in
            var res:String = ""
            for val in querySnapshot!.documents {
                let nm = val.get("name") as! String
                let ml = val.get("mail") as! String
                let ag = val.get("age") as! Int
                res += nm + "[" + ml + ":" + String(ag) + "\n"
            }
            self.dataView.text = res
        }
    }
       
//
//        let ref = defaultStore.collection("user").document("moji1")
//
//              ref.getDocument{ (document, error) in
//                  if let document = document {
//                      print("Tea=Darjeeling : Document data \(document.data())")
//                  }else{
//                      print("Document does not exist")
//                  }
//              }

        // Do any additional setup after loading the view.
        
    }
    

    




