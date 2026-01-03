import UIKit

final class TaskListViewController: UITableViewController {

    private var taskList: [ToDoTask] = []
    private let cellID = "task"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.backgroundColor = .white
        setupNavigationBar()
    }

    @objc private func addNewTask() {
        let newTaskVC = NewTaskViewControllerFactory()
        present(newTaskVC, animated: true)
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

