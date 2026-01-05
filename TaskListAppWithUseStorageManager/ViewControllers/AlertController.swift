import UIKit

final class AlertController: UIViewController {
    
    private lazy var seeAlertButton: UIButton = {
        let button = FilledButtonFactory(title: "Alert", color: .green, action: UIAction {
            [unowned self] _ in testTheAlert()
        })
        return button.createButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(seeAlertButton)
        setConstraints()
    }
    
    private func showTheAlert(_ title: String, _ message: String) {
        let theAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        theAlert.addAction(okAction)
        theAlert.addAction(cancelAction)
        present(theAlert, animated: true)
    }
    
    private func testTheAlert() {
        showTheAlert("Hello", "This is a test alert")
    }
}

extension AlertController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            seeAlertButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            seeAlertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            seeAlertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


#Preview {
    AlertController()
}
