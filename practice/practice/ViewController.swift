//
//  ViewController.swift
//  practice
//
//  Created by 김우경 on 11/27/23.
//

import UIKit

struct family {
    let mtName: String
    let bestFriendName: String
    let nextFriendName: String
}

class ViewController: UIViewController {
    
    let friendNames: [String] = ["Hanry", "Leeo", "Jay"]
    let koreanNames: [String: String] = ["Hanry": "헨리", "Leeo": "리이오", "Jay": "제이"]
    let friend = family(mtName: "Hanry", 
                        bestFriendName: "Leeo",
                        nextFriendName: "Jay")
    var count: Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bestFriendNameLabel: UILabel!
    @IBOutlet weak var nextFriendNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        nameLabel.text = koreanNames[friend.mtName]
        bestFriendNameLabel.text = koreanNames[friend.bestFriendName]
        nextFriendNameLabel.text = koreanNames[friend.nextFriendName]
       

    }

}

