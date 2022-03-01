import UIKit

class AppsGroupHorizontalCell: UICollectionViewCell {

    // seta o app a ser exibido quando recebido pelo AppGroupHorizontalCellViewController
    var app: App?{
        didSet{
            if let app = app {
                iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    let iconImageView: UIImageView = .iconImageView()
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLine: 2)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let getButton: UIButton = .makeButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let bottomLine = CALayer()

        bottomLine.frame = CGRect(x: 80, y: bounds.width, width: bounds.width - 80 , height: 0.8)
        bottomLine.backgroundColor = UIColor.grayCustom.cgColor

        layer.addSublayer(bottomLine)

        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 4
        titleCompanyStackView.axis = .vertical

        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyStackView, getButton])

        stackView.spacing = 12
        stackView.alignment = .center
        addSubview(stackView)

        stackView.fillSuperview()

    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    
}
