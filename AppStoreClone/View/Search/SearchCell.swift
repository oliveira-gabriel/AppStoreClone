
import UIKit
import SDWebImage
class SearchCell: UITableViewCell {

    var app: App! {
        didSet {
            titleLabel.text = app.nome
            companyLabel.text = app.empresa

            iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)

            if let screenshotUrls = app.screenshotUrls {
                if screenshotUrls.count > 0 {
                    self.screenshot1.sd_setImage(with: URL(string: screenshotUrls[0]), completed: nil)
                }
                if screenshotUrls.count > 1 {
                    self.screenshot2.sd_setImage(with: URL(string: screenshotUrls[1]), completed: nil)
                }
                if screenshotUrls.count > 2 {
                    self.screenshot3.sd_setImage(with: URL(string: screenshotUrls[2]), completed: nil)
                }

            }
        }
    }

    let iconImageView: UIImageView = .iconImageView()
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLine: 2)
    let companyLabel: UILabel = .textLabel(text: "Empresa nome", fontSize: 14)
    let getButton: UIButton = .makeButton()

    let screenshot1: UIImageView = .screenshotImageView()
    let screenshot2: UIImageView = .screenshotImageView()
    let screenshot3: UIImageView = .screenshotImageView()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        let titleCompanyStackView = UIStackView(
            arrangedSubviews: [
                titleLabel,
                companyLabel
            ]
        )

        titleCompanyStackView.spacing = 8
        titleCompanyStackView.axis = .vertical

        let headerStackView = UIStackView(
            arrangedSubviews: [
                iconImageView,
                titleCompanyStackView,
                getButton
            ]
        )

        headerStackView.spacing = 12
        headerStackView.alignment = .center


        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenshot1,
            screenshot2,
            screenshot3
        ])

        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually

        let globalStackView = UIStackView(arrangedSubviews: [
            headerStackView,
            screenshotStackView
        ])

        globalStackView.spacing = 16
        globalStackView.axis = .vertical

        addSubview(globalStackView)
        globalStackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
