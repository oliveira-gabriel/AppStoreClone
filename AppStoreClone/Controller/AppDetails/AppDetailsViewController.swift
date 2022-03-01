import UIKit

// UICollectionViewDelegateFlowLayout para permitir trabalhar com tamanhos
class AppDetailsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let headerId = "headerId"

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
    }


}


extension AppDetailsVC {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! AppDetailsHeaderCell

        cell.backgroundColor = .grayCustom

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        let width: CGFloat = view.bounds.width
        let height: CGFloat = 170
        return .init(width: width, height: height)
    }
}
