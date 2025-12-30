import UIKit

final class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }


}

extension TaskListViewController {
    private func setupNavigationBar() {
        title = "Tasks"
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        //  FOR NORMAL VIEW
        let navBarApperance = UINavigationBarAppearance()
        navBarApperance.configureWithOpaqueBackground()
        navBarApperance.backgroundColor = UIColor(red: 100/255, green: 255/255, blue: 100/255, alpha: 1.0)
        navBarApperance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarApperance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        //  FOR SCROLL VIEW
        let scrollNavBarApperance = UINavigationBarAppearance()
        scrollNavBarApperance.configureWithDefaultBackground()
        scrollNavBarApperance.backgroundColor = UIColor(red: 255/255, green: 100/255, blue: 255/255, alpha: 1.0)
                
        navigationController?.navigationBar.standardAppearance = navBarApperance
        navigationController?.navigationBar.scrollEdgeAppearance = scrollNavBarApperance
    }
    
}

