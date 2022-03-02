
import UIKit


class TodayDetailsUniqueVC: UITableViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white

        self.addHeader()
    }


    func addHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: 380))
        headerView.backgroundColor = .red
        let todayCell = TodayCell()
        todayCell.layer.cornerRadius = 0

        headerView.addSubview(todayCell)
        todayCell.fillSuperview()

        self.tableView.tableHeaderView = headerView
    }
}

extension TodayDetailsUniqueVC {

}
