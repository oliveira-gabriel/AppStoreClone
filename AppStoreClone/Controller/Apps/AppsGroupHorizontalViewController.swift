import UIKit


class AppsGroupHorizontalVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"

    var apps: [App] = []

    init(){
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal


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


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width - 40, height: view.bounds.height / 3 - 1)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.apps.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupHorizontalCell
        cell.app = self.apps[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
