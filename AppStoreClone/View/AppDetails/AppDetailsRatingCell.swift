import UIKit


class AppDetailsRatingCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var cellId = "cellId"

    let titleLabel: UILabel = .textBoldLabel(text: "Avaliação e opniões", fontSize: 24)
    var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.backgroundColor = .red

        // seta espaçamento no inicio e fim do container
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        // remove scroll indicator
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(CommentsCell.self, forCellWithReuseIdentifier: cellId)

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
extension AppDetailsRatingCell {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CommentsCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
    }
}


class CommentsCell: UICollectionViewCell {


    let titleLabel: UILabel = .textBoldLabel(text: "Muito bom", fontSize: 16)
    let commentLabel: UILabel = .textLabel(text: "Recomendo bastante este app, está muito bom", fontSize: 16, numberOfLine: 0)


    let ratingImageView: UIImageView = UIImageView()


    override init(frame: CGRect) {
        super.init(frame: frame)


        ratingImageView.size(size: .init(width: 120, height: 24))
        ratingImageView.contentMode = .scaleAspectFit

        backgroundColor = .background
        layer.cornerRadius = 12
        layer.masksToBounds = true
        clipsToBounds = true


        ratingImageView.image = UIImage(named: "avaliacao-4")

        let stackView = UIStackView(arrangedSubviews: [titleLabel, ratingImageView, commentLabel])

        addSubview(stackView)
        stackView.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
