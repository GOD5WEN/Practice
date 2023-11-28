//
//  MyTabelViewController.swift
//  practice
//
//  Created by 김우경 on 11/27/23.
//

import UIKit

class MyTabelViewController: UIViewController {


    @IBOutlet weak var myTableView: UITableView!
    
    let friendNames: [String] = ["Hanry", "Leeo", "Jay", "Key"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.backgroundColor = .brown
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension MyTabelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text =  friendNames[indexPath.row]
        return cell
    }
    
}
