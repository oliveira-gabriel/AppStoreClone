import UIKit

class TodayMultipleCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {

    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                catogoryLabel.text = todayApp.categoria
                titleLabel.text = todayApp.titulo

                tableView.reloadData()
            }
        }
    }

    let cellId = "cellId"

    let catogoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLine: 2)


    var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true

        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false

        tableView.isUserInteractionEnabled = false

        tableView.register(TodayMultipleAppCell.self, forCellReuseIdentifier: cellId)

        let stackView = UIStackView(arrangedSubviews: [catogoryLabel, titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 8

        addSubview(stackView)
        // stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        stackView.fill(
            top: self.safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 24, bottom: 24, right: 24)
        )

        addSubview(tableView)
        tableView.fill(
            top: stackView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 24, left: 24, bottom: 24, right: 24)
        )
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

// make layout
extension TodayMultipleCell {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todayApp?.apps?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayMultipleAppCell
        cell.app = self.todayApp?.apps?[indexPath.item]
        return cell
    }
}
