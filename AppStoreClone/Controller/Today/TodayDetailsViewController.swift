import UIKit


class TodayDetailsVC: UIViewController {


    var centerView: UIView?
    var frame: CGRect?


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        centerView = UIView()

    }

    func animated() {
        guard let centerView = self.centerView else { return }
        guard let frame = self.frame else { return }

        centerView.backgroundColor = .blue
        centerView.frame = frame

        view.addSubview(centerView)
    }
}
