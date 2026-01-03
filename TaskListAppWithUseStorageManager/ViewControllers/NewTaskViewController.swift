import UIKit

final class NewTaskViewController: UIViewController {
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "New Task"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        // Set attribute for button title
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        //  Create button
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .milkBlue
        buttonConfig.attributedTitle = AttributedString("Save task", attributes: attributes)
        
        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction { [unowned self] _ in
            save()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 18)
        
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.baseBackgroundColor = .milkRed
        buttonConfig.attributedTitle = AttributedString("Cancel", attributes: attributes)
        
        let button = UIButton(configuration: buttonConfig, primaryAction: UIAction { [unowned self] _ in
            cancel()
        })
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews(taskTextField, saveButton, cancelButton)
        setConstraints()
    }
    
    private func save() {
        dismiss(animated: true)
    }
    
    private func cancel() {
        dismiss(animated: true)
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
                
                saveButton.topAnchor.constraint(equalTo: taskTextField.topAnchor, constant: 60),
                saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                
                cancelButton.topAnchor.constraint(equalTo: saveButton.topAnchor, constant: 60),
                cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
            ]
        )
    }
}

extension NewTaskViewController {
    
}

#Preview {
    NewTaskViewController()
}
