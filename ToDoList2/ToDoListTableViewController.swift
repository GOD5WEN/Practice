//
//  ToDoListTableViewController.swift
//  ToDoList2
//
//  Created by 김우경 on 12/20/23.


import UIKit

class ToDoListTableViewController: UITableViewController {

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // 기존에 저장된 Todo 데이터 불러오기
        if let savedData = UserDefaults.standard.value(forKey: "ToDoList") as? Data {
            do {
                let decoder = JSONDecoder()
                ToDoList.dummyToDoList = try decoder.decode([ToDoList].self, from: savedData)
            } catch {
                print("Error decoding TodoList: \(error.localizedDescription)")
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoList.dummyToDoList.count
    }
    // 날짜와 시간을 좀더 사용자 친화적으로 만들기 & 한국어로 패치하기
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let target = ToDoList.dummyToDoList[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)

        // 완료된 Todo에 대한 UI 변경
        if target.isCompleted {
            cell.textLabel?.textColor = .lightGray
            cell.detailTextLabel?.textColor = .lightGray
            cell.accessoryType = .checkmark
        } else {
            cell.textLabel?.textColor = .black
            cell.detailTextLabel?.textColor = .black
            cell.accessoryType = .none
        }

        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = ToDoList.dummyToDoList[indexPath.row]
        selectedToDo.isCompleted.toggle()

        // Todo를 업데이트하고 테이블 뷰를 리로드합니다.
        ToDoList.dummyToDoList[indexPath.row] = selectedToDo
        saveToDoList()  // 완료 여부 변경할 때마다 데이터 저장
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Action

    @IBAction func addTodoButtonTapped(_ sender: Any) {
        showAddTodoAlert()
    }

    // MARK: - Alert

    private func showAddTodoAlert() {
        let alertController = UIAlertController(title: "Add Todo", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Enter todo title"
        }

        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                // 새로운 Todo 추가 로직
                let newTodo = ToDoList(content: title, insertDate: Date(), isCompleted: false)
                ToDoList.dummyToDoList.append(newTodo)
                self.saveToDoList()  // 추가할 때마다 데이터 저장
                self.tableView.reloadData()
            }
        }

        alertController.addAction(addAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    // MARK: - Data Handling

    private func saveToDoList() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(ToDoList.dummyToDoList)
            UserDefaults.standard.set(data, forKey: "ToDoList")
        } catch {
            print("Error encoding TodoList: \(error.localizedDescription)")
        }
    }

    // MARK: - Swipe Actions (Edit, Delete)

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [weak self] (_, _, completionHandler) in
            self?.showEditTodoAlert(at: indexPath)
            completionHandler(true)
        }
        editAction.backgroundColor = .blue

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
            self?.deleteTodo(at: indexPath)
            completionHandler(true)
        }

        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }

    // MARK: - Edit and Delete Methods

    private func showEditTodoAlert(at indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Edit Todo", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Edit todo title"
            textField.text = ToDoList.dummyToDoList[indexPath.row].content
        }

        let editAction = UIAlertAction(title: "Edit", style: .default) { [weak self] _ in
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                // Todo 수정 로직
                ToDoList.dummyToDoList[indexPath.row].content = title
                self?.saveToDoList()  // 수정할 때마다 데이터 저장
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }

        alertController.addAction(editAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }

    
    private func deleteTodo(at indexPath: IndexPath) {
        ToDoList.dummyToDoList.remove(at: indexPath.row)
        saveToDoList()  // 삭제할 때마다 데이터 저장
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
