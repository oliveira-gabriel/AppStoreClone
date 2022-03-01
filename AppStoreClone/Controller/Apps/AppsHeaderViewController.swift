import UIKit


class AppsHeader: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    var collectionView: UICollectionView!

    var appsHighlights: [AppHighlight] = []

    override init(frame: CGRect) {
        super.init(frame: frame)

        // usa o component de layout com Snapping
        let layout = SnappingLayout()

        // seta a direção do scroll
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)

        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)

        // add collectionView na subview
        addSubview(collectionView)
        collectionView.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}


extension AppsHeader{

    // seta a quantidade de itens
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsHighlights.count
    }

    // seta o item a ser exibido pela celula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        cell.appHighlight = self.appsHighlights[indexPath.item]
        return cell
    }

    // seta o espacamento
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: bounds.width - 40, height: bounds.height)
    }
}
