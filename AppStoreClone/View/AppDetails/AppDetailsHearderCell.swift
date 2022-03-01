import UIKit


class AppDetailsHeaderCell: UICollectionViewCell {

    let iconImageView: UIImageView = .iconImageView(width: 128, height: 128)

    let nameLabel: UILabel = .textLabel(text: "App name", fontSize: 20, numberOfLine: 2)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let button: UIButton = .makeButton()


    override init(frame: CGRect) {
        super.init(frame: frame)

        iconImageView.image = UIImage(named: "icone")

        let buttonStackView = UIStackView(arrangedSubviews: [button, UIView()])
        let titleCompanyLabelStackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel,buttonStackView])
        titleCompanyLabelStackView.axis = .vertical
        titleCompanyLabelStackView.spacing = 12

        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyLabelStackView])
        stackView.alignment = .center
        stackView.spacing = 12
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))

    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}
