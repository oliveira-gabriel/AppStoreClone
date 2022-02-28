
import UIKit

class SearchVC: UITableViewController, UISearchBarDelegate {

    let cellId = "cellId"
    let searchController = UISearchController(searchResultsController: nil)

    var apps: [App] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSearchBar()
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)

    }
    func configureSearchBar() {
        navigationItem.searchController = self.searchController
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "App Store"
        self.searchController.searchBar.delegate = self

        navigationItem.hidesSearchBarWhenScrolling = false
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchApps(text: searchText)
    }
}

extension SearchVC {
    func searchApps (text: String){
        SearchService.shared.searchApps(text: text){ (apps, err) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
        }

    }
}

extension SearchVC {

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchCell
        cell.app = self.apps[indexPath.item]
        return cell

    }
}
