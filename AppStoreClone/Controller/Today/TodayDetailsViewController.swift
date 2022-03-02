import UIKit


class TodayDetailsVC: UIViewController {


    var centerView: UIView?
    var frame: CGRect?
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        
        centerView = UIView()

    }

    func animated() {
        guard let centerView = self.centerView else { return }
        guard let frame = self.frame else { return }
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.backgroundColor = .blue
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true


        view.addSubview(centerView)

        // seta a constraint do top a mesma do frame e não a da view
        self.topConstraint = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthConstraint = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heightConstraint = centerView.heightAnchor.constraint(equalToConstant: frame.height)

        self.topConstraint?.isActive = true
        self.leadingConstraint?.isActive = true
        self.widthConstraint?.isActive = true
        self.heightConstraint?.isActive = true

        // atualiza o layout da view
        view.layoutIfNeeded()


    }
}
