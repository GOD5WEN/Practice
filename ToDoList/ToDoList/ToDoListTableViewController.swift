//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by 김우경 on 12/20/23.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return ToDoList.dummyToDoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ToDoListTableViewCell


        let todoItem = ToDoList.dummyToDoList[indexPath.row]
        cell.titleLabel.text = todoItem.content
        cell.dateLabel.text = formatDate(todoItem.insertDate)
        cell.completedSwitch.isOn = todoItem.isCompleted
        return cell
    }
     
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
