import UIKit


class AppsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let headerId = "headerId"
    var appsHighlights: [AppHighlight] = []
    var appsGroups: [AppGroup] = []

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white

        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)

        self.searchHighLighted()
        self.searchGroup(type: "apps-que-amamos")
        self.searchGroup(type: "top-apps-gratis")
        self.searchGroup(type: "top-apps-pagos")
    }

}

extension AppsVC {
    func searchHighLighted(){
        AppService.shared.searchAppsInHighlighted(){ (apps, err) in
            if let err = err {
                print(err)
                return
            }
            if let apps = apps {
                DispatchQueue.main.async {
                    self.appsHighlights = apps
                    self.collectionView.reloadData()
                }
            }
        }
    }

    func searchGroup (type: String) {
        AppService.shared.searchGroup(type: type) { group, err in
            if let err = err {
                print(err)
                return

            }

            if let group = group {
                DispatchQueue.main.async {
                    self.appsGroups.append(group)
                    self.collectionView.reloadData()
                }
            }

        }
    }
}


extension AppsVC {

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader

        header.appsHighlights = self.appsHighlights
        header.collectionView.reloadData()
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsGroups.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        cell.group = self.appsGroups[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 250)
    }

}
