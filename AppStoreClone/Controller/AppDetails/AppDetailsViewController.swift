import UIKit

// UICollectionViewDelegateFlowLayout para permitir trabalhar com tamanhos
class AppDetailsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"

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
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }


}


extension AppDetailsVC {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

        cell.backgroundColor = .grayCustom

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 250)
    }
}
