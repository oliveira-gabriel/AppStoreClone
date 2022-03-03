import UIKit

class TodayMultipleCell: UICollectionViewCell {

    let catogoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLine: 2)

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true



        let stackView = UIStackView(arrangedSubviews: [catogoryLabel, titleLabel])
        stackView.axis = .vertical
        stackView.spacing = 8

        addSubview(stackView)
//        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        stackView.fill(
            top: self.safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 24, bottom: 24, right: 24)
        )
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
