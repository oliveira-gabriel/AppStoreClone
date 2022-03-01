import UIKit


class TodayVC: UICollectionViewController {



    let cellId = "cellId"

    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }


    required init?(coder: NSCoder) {
        fatalError()
    }



    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)

    }

}


extension TodayVC {

    // informa o numero de celulas que teremos
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    // informa qual o layout da celula
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .red
        

        return cell
    }
}
