import UIKit

// UICollectionViewDelegateFlowLayout para permitir trabalhar com tamanhos
class AppDetailsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let headerId = "headerId"
    let descriptionId = "descriptionId"
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }


    required init?(coder: NSCoder) {
        fatalError()
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never

        collectionView.backgroundColor = .white
        collectionView.register(AppDetailsHeaderCell.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: descriptionId)
    }


}


extension AppDetailsVC {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! AppDetailsHeaderCell
            return cell
        }

        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionId, for: indexPath)
            return cell
        }

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let width: CGFloat = view.bounds.width
        let height: CGFloat = 170
        return .init(width: width, height: height)
    }
}
