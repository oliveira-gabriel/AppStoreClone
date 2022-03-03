import UIKit


class TodayVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {



    let cellId = "cellId"
    let multipleId = "multipleId"
    let headerId = "headerId"

    var todayApps: [TodayApp] = []

    let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)

        ai.color = UIColor.systemGray
        ai.startAnimating()
        ai.hidesWhenStopped = true

        return ai
    }()

    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }


    required init?(coder: NSCoder) {
        fatalError()
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(TodayMultipleCell.self, forCellWithReuseIdentifier: multipleId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)

        view.addSubview(activityIndicator)
        activityIndicator.centerSuperview()

        self.searchTodayHighlights()
    }

}

extension TodayVC {
    func searchTodayHighlights () {
        TodayService.shared.searchTodayHighlight { apps, err in
            DispatchQueue.main.async {
                if let apps = apps {
                    self.todayApps = apps
                    self.collectionView.reloadData()
                    self.activityIndicator.stopAnimating()
                }

            }
        }
    }
}

extension TodayVC {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: 90)
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        header.backgroundColor = .red
        return header
    }

    // informa o numero de celulas que teremos
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayApps.count
    }

    // informa qual o layout da celula
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell

        if indexPath.item < 2 {
            cell.todayApp = todayApps[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multipleId, for: indexPath) as! TodayMultipleCell
            cell.todayApp = todayApps[indexPath.item]
            return cell
        }

    }

    // seta o tamanho da celula
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return .init(width: view.bounds.width - 48, height: view.bounds.width + 48)
    }

    // seta o espaço entre as sessoes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }


    // insere padding no container do TodayCell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 32, right: 0)
    }
}

extension TodayVC {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pega a celula clicada
        if let cell = collectionView.cellForItem(at: indexPath) {
            // pega a posicao da celula(frame)
            if let frame = cell.superview?.convert(cell.frame, to: nil){

                tabBarController?.tabBar.isHidden = true
                
                let modalView = TodayDetailsVC()

                modalView.modalPresentationStyle = .overCurrentContext

                modalView.handlerClose = {
                    self.tabBarController?.tabBar.isHidden = false
                }

                // configuration of navigator
                let modalNav = UINavigationController(rootViewController: modalView)
                modalNav.modalPresentationStyle = .overCurrentContext
                modalNav.view.backgroundColor = .clear


                self.present(modalNav, animated: false){
                    modalView.frame = frame
                    modalView.todayApp = self.todayApps[indexPath.item]
                }
            }
        }
    }
}
