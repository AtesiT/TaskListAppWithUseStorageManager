import UIKit

final class AlertController: UIViewController {
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

