import UIKit
internal import CoreData

protocol NewTaskViewControllerDelegate: AnyObject {
    func reloadData()
}

final class TaskListViewController: UITableViewController {

    private var taskList: [ToDoTask] = []
    private let cellID = "task"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.backgroundColor = .white
        setupNavigationBar()
        fetchData()
    }

    @objc private func addNewTask() {
        let newTaskVC = NewTaskViewControllerFactory()
        newTaskVC.delegate = self
        present(newTaskVC, animated: true)
    }

    private func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest = ToDoTask.fetchRequest()
        
        do {
            taskList = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
        
    }
}

//  MARK: - UITableViewDataSource
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let toDoTask = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = toDoTask.title
        cell.contentConfiguration = content
        
        return cell
    }
}


// MARK: - Setup UI

private extension TaskListViewController {
    private func setupNavigationBar() {
        //  SETTINGS OF NAVIGATION BAR
        title = "Tasks"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addNewTask)
        )
        navigationController?.navigationBar.tintColor = .white
        
        //  FOR NORMAL VIEW
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.backgroundColor = .milkBlue
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //  FOR SCROLL VIEW
        let scrollNavBarApperance = UINavigationBarAppearance()
        scrollNavBarApperance.configureWithDefaultBackground()
        scrollNavBarApperance.backgroundColor = .milkBlue
        scrollNavBarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        scrollNavBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = scrollNavBarApperance
    }
    
}

extension TaskListViewController: NewTaskViewControllerDelegate {
    func reloadData() {
        fetchData()
        tableView.reloadData()
    }
}
