import UIKit


class AppDetailsDescriptionCell: UICollectionViewCell {
    var app: App? {
        didSet {
            if let app = app {
                descriptionLabel.text = app.descricao
            }
        }
    }
    let titleLabel: UILabel = .textBoldLabel(text: "Novidades", fontSize: 24)
    let descriptionLabel: UILabel = .textLabel(text: "Descrição", fontSize: 12, numberOfLine: 0)
    override init(frame: CGRect) {
        super.init(frame: frame)


        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.spacing = 12
        stackView.axis = .vertical



        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
