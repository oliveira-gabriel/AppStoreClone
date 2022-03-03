import UIKit


class TodayDetailsVC: UIViewController {


    var todayApp: TodayApp? {

        didSet{
            if let todayApp = todayApp {
                if todayApp.apps == nil {
                    self.addUnique()
                } else {
                    self.addMultiple()
                }

            }
        }
    }
    let closeButton: UIButton = .closeButton()
    var centerView: UIView?
    var frame: CGRect?

    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?

    let todayDetailsUniqueVC = TodayDetailsUniqueVC()
    let todayDetailsMultipleVC = TodayDetailsMultipleVC()

    var handlerClose: (() ->())?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear

    }

    func addCloseButton() {
        view.addSubview(closeButton)
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(handleCloseSelector), for: .touchUpInside)

        closeButton.fill(
            top: self.view.safeAreaLayoutGuide.topAnchor,
            leading: nil,
            trailing: view.trailingAnchor,
            bottom: nil,
            padding: .init(top: 18, left: 0, bottom: 0, right: 24),
            size: .init(width: 32, height: 32)
        )

        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations:  {
            self.closeButton.alpha = 1
        }, completion: nil)

    }
    
    func addUnique() {
        todayDetailsUniqueVC.todayApp = self.todayApp
        self.centerView = todayDetailsUniqueVC.view
        self.animated()
    }

    func addMultiple() {
        todayDetailsMultipleVC.todayApp = self.todayApp
        self.centerView = todayDetailsMultipleVC.view
        self.animated()
    }

    func animated() {
        guard let centerView = self.centerView else { return }
        guard let frame = self.frame else { return }

        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true


        view.addSubview(centerView)
        self.addCloseButton()

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

        UIView.animate(withDuration: 0.3, delay: 0.0, options: .overrideInheritedCurve, animations: {

            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height

            self.centerView?.layer.cornerRadius = 0

            self.view.layoutIfNeeded()

        }, completion: nil)


    }

    func closeAnimation() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .overrideInheritedCurve, animations: {

            if let frame = self.frame {
                self.topConstraint?.constant = frame.origin.y
                self.leadingConstraint?.constant = frame.origin.x

                self.widthConstraint?.constant = frame.width
                self.heightConstraint?.constant = frame.height

                self.centerView?.layer.cornerRadius = 16
                self.view.layoutIfNeeded()
            }

        }) { _ in
            self.dismiss(animated: false, completion: nil)
        }
    }
    @objc func handleCloseSelector() {
        self.closeButton.isHidden = true
        self.handlerClose?()
        self.closeAnimation()

    }
}
