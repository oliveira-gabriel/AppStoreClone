import UIKit


class AppDetailsScreenshotCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"

    var app: App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }

    let titleLabel: UILabel = .textBoldLabel(text: "Pré-visualizar", fontSize: 24)
    var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast

        // serve para informar que é o AppDetailsScreenshot que cuida da collection
        collectionView.delegate = self
        collectionView.dataSource = self

        // seta espaçamento no inicio e fim do container
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 100)

        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)

        addSubview(titleLabel)

        titleLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )

        addSubview(collectionView)
        collectionView.fill(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}


extension AppDetailsScreenshotCell {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.screenshotUrls?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
        if let imageUrl = self.app?.screenshotUrls?[indexPath.item]{
            cell.imageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        }

        return cell
    }

    // seta tamanho das celulas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 220, height: collectionView.bounds.height)
    }
}


class ScreenshotCell: UICollectionViewCell {

    let imageView: UIImageView = .screenshotImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView.image = UIImage(named: "screenshot")
        addSubview(imageView)
        imageView.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
