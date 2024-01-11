//
//  Model.swift
//  ToDoList2
//
//  Created by 김우경 on 12/20/23.
//

import Foundation

class ToDoList: Codable {
    
    var content: String
    var insertDate: Date
    var isCompleted: Bool
    
    init(content: String = "",
         insertDate: Date = .now,
         isCompleted: Bool = false) {
        self.content = content
        self.insertDate = insertDate
        self.isCompleted = isCompleted
    }
    
    static var dummyToDoList = [
        ToDoList(content: "오늘 할일", insertDate: .now, isCompleted: false),
        ToDoList(content: "내일 할일", insertDate: .now, isCompleted: false)
    ]
}
