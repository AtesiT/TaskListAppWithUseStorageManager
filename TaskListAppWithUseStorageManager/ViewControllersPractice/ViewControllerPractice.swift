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
    
    //  MARK: - Label
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //  MARK: - Settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(textField)
        view.addSubview(label)
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
            
            label.topAnchor.constraint(equalTo: textField.topAnchor, constant: 50),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

        ])
    }
}

#Preview {
    ViewControllerPractice()
}
