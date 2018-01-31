import UIKit

// MARK: TestViewController

class TestViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet var testView: TestView!

    // MARK: View Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        testView.delegate = self
    }
}

// MARK: TestViewDelegate Methods

extension TestViewController: TestViewDelegate {
    func testView(_ testView: TestView, didSelect button: UIButton) {
        guard let buttonText = button.titleLabel?.text else {
            return
        }

        print("\(buttonText) pressed")
    }
}

