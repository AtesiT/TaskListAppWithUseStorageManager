import UIKit

final class SecondViewControllerRepeat: UIViewController {
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.text = "Hello, World!"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


#Preview {
    SecondViewControllerRepeat()
}
