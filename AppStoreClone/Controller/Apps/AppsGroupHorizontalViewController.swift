import UIKit


class AppsGroupHorizontalVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"

    var apps: [App] = []


    var callback: ((App) -> ())?

    init(){
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal

        // seta o layout da collection view
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white

        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(AppsGroupHorizontalCell.self, forCellWithReuseIdentifier: cellId)
    }
}

extension AppsGroupHorizontalVC {

    // seta o tamanho da collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 40, height: view.bounds.height / 3 - 1)
    }

    // seta a quantidade de itens
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.apps.count
    }

    // seta a celula a ser exibida
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupHorizontalCell
        cell.app = self.apps[indexPath.item]
        return cell
    }

    // seta o espaço entre as sections
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    // seta o espaco entre os itens
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // pega o evento de click na celula
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.callback?(self.apps[indexPath.item])
    }
}
