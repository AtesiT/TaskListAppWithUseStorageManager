import UIKit

final class ViewControllerPractice: UIViewController {
    private lazy var button: UIButton = {
        let button = FilledButtonFactory(
            title: "Tap",
            color: .green,
            action: UIAction { [unowned self] _ in
                buttonAction()
            })
        return button.createButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
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
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

#Preview {
    ViewControllerPractice()
}
