import UIKit


class AppsHeaderCell: UICollectionViewCell {


    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 12)
    let descriptionLabel: UILabel = .textLabel(text: "App description", fontSize: 20, numberOfLine: 2)
    let imageView: UIImageView = .screenshowImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        companyLabel.textColor = UIColor.blueCustom

        let stackView = UIStackView(arrangedSubviews: [companyLabel,descriptionLabel,imageView])

        stackView.axis = .vertical
        stackView.spacing = 8

        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))

    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
