import UIKit

// MARK: TestViewDelegate

protocol TestViewDelegate: class {
    func testView(_ testView: TestView, didSelect button: UIButton)
}

// MARK: TestView

class TestView: UIView {

    // MARK: Delegates

    weak var delegate: TestViewDelegate?

    // MARK: Outlets

    @IBOutlet var contentView: UIView!
    @IBOutlet var button: UIButton!

    // MARK: UIView Methods

    override func awakeFromNib() {
        super.awakeFromNib()

        setupButton()
    }

    // MARK: Action Methods

    @IBAction func buttonPressed(sender: Any?) {
        guard let button = sender as? UIButton else {
            return
        }

        delegate?.testView(self, didSelect: button)
    }
    
    // MARK: Helper Methods

    private func setupButton() {
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
    }

    // MARK: Init Methods

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: TestView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
