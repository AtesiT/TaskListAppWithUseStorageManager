import UIKit

final class ViewControllerPractice: UIViewController {
    
    //  MARK: - Button
    private lazy var button: UIButton = {
        let button = FilledButtonFactory(
            title: "Tap",
            color: .green,
            action: UIAction { [unowned self] _ in
                buttonAction()
            })
        return button.createButton()
    }()
    
    //  MARK: - TextField
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Add Text"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    //  MARK: - Settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(textField)
        setConstrains()
    }
    
    private func buttonAction() {
        return
    }
}

private extension ViewControllerPractice {
    func setConstrains() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textField.topAnchor.constraint(equalTo: button.topAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}

#Preview {
    ViewControllerPractice()
}
