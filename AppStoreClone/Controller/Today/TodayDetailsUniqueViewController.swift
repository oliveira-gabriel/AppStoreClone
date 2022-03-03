
import UIKit


class TodayDetailsUniqueVC: UITableViewController {

    let cellId = "cellId"
    var todayApp: TodayApp? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(TodayDetailsUniqueCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        self.addHeader()
    }


    func addHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: 380))
        headerView.backgroundColor = .red
        let todayCell = TodayCell()

        todayCell.todayApp = self.todayApp
        
        todayCell.layer.cornerRadius = 0

        headerView.addSubview(todayCell)
        todayCell.fillSuperview()

        self.tableView.tableHeaderView = headerView
    }
}

extension TodayDetailsUniqueVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
      }
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayDetailsUniqueCell
        return cell
      }
}
