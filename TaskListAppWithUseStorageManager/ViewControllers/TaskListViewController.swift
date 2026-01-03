import UIKit

final class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }

    @objc private func addNewTask() {
        let newTaskVC = NewTaskViewControllerFactory()
        present(newTaskVC, animated: true)
    }
}

extension TaskListViewController {
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

