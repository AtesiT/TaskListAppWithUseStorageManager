import UIKit

final class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }

    @objc private func addNewTask() {
        let newTaskVC = NewTaskViewController()
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
        navBarApperance.backgroundColor = UIColor(red: 100/255, green: 255/255, blue: 100/255, alpha: 1.0)
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //  FOR SCROLL VIEW
        let scrollNavBarApperance = UINavigationBarAppearance()
        scrollNavBarApperance.configureWithDefaultBackground()
        scrollNavBarApperance.backgroundColor = UIColor(red: 255/255, green: 100/255, blue: 255/255, alpha: 1.0)
        scrollNavBarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        scrollNavBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = scrollNavBarApperance
    }
    
}

