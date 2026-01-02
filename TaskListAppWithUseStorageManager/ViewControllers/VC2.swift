import UIKit

final class SecondViewControllerRepeat: UIViewController {
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.text = "Hello, World!"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap me", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var theView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(theView)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 50),
            button.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            theView.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20),
            theView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theView.widthAnchor.constraint(equalToConstant: 100),
            theView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}


#Preview {
    SecondViewControllerRepeat()
}
