import UIKit


class AppsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let headerId = "headerId"
    var appsHighlights: [AppHighlight] = []
    var appsGroups: [AppGroup] = []
    let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)



    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // inicia o controller
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicatorView.color = UIColor.grayCustom
        activityIndicatorView.startAnimating()

        activityIndicatorView.hidesWhenStopped = true
        collectionView.backgroundColor = .white

        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)

        // adiciona o component de loading dentro da pagina 
        view.addSubview(activityIndicatorView)

        activityIndicatorView.centerSuperview()

        self.searchApps()

    }

}

extension AppsVC {

    // faz get no banco de dados
    func searchApps () {
        var appsInHighlight: [AppHighlight]?
        var appsLoveds: AppGroup?
        var appsFree: AppGroup?
        var appsPay: AppGroup?

        let dispatchGroup = DispatchGroup()

        dispatchGroup.enter()
        AppService.shared.searchAppsInHighlighted { (apps, err) in
            appsInHighlight = apps
            dispatchGroup.leave()
        }

        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "apps-que-amamos") { (group, err) in
            appsLoveds = group
            dispatchGroup.leave()

        }
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "top-apps-gratis") { (group, err) in
            appsFree = group
            dispatchGroup.leave()

        }
        dispatchGroup.enter()
        AppService.shared.searchGroup(type: "top-apps-pagos") { (group, err) in
            appsPay = group
            dispatchGroup.leave()

        }


        dispatchGroup.notify(queue: .main) {
            if let apps = appsInHighlight {
                self.appsHighlights = apps
            }
            if let apps = appsLoveds {
                self.appsGroups.append(apps)
            }
            if let apps = appsFree {
                self.appsGroups.append(apps)
            }
            if let apps = appsPay {
                self.appsGroups.append(apps)
            }

            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
        }
    }

}


extension AppsVC {

    // seta o header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader

        header.appsHighlights = self.appsHighlights
        header.collectionView.reloadData()
        return header
    }

    // seta o padding
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }

    // seta o tamanho
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }

    // seta a quantidade de grupos
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsGroups.count
    }

    // retorna a celula do grupo
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        cell.group = self.appsGroups[indexPath.item]
        return cell
    }

    // seta o tamanho da celula
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 280)
    }

}
