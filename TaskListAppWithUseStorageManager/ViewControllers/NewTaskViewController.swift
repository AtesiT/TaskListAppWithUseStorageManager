import UIKit

final class NewTaskViewController: UIViewController {
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews(taskTextField)
        setConstraints()
    }
}

// MARK: SETUP UI

private extension NewTaskViewController {
    func setupSubviews(_ subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate(
            [
                taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
//                taskTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20)
            ]
        )
    }
}

extension NewTaskViewController {
    
}

#Preview {
    NewTaskViewController()
}
