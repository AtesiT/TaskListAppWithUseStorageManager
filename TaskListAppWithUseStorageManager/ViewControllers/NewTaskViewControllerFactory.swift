import UIKit

final class NewTaskViewControllerFactory: UIViewController {
    private lazy var saveButton: UIButton = {
        let filledButtonFactory = FilledButtonFactory(
            title: "Save Task",
            color: .milkBlue,
            action: UIAction { [unowned self] _ in
                    save()
        })
        return filledButtonFactory.createButton()
    }()
    
    private lazy var cancelButton: UIButton = {
        let filledButtonFactory = FilledButtonFactory(
            title: "Cancel",
            color: .milkRed,
            action: UIAction { [unowned self] _ in
                    cancel()
        })
        return filledButtonFactory.createButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(saveButton)
        view.addSubview(cancelButton)
        setConstraints()
    }
    
    private func save() {
        dismiss(animated: true)
    }
    
    private func cancel() {
        dismiss(animated: true)
    }
}

private extension NewTaskViewControllerFactory {
    func setConstraints() {
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cancelButton.topAnchor.constraint(equalTo: saveButton.topAnchor, constant: 60),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


#Preview {
    NewTaskViewControllerFactory()
}
