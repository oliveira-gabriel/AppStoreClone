import UIKit
import SDWebImage

class AppsHeaderCell: UICollectionViewCell {

    // seta o appHighlight quando enviado pelo AppHeaderViewController 
    var appHighlight: AppHighlight? {
        didSet{
            if let appHighlight = appHighlight {
                companyLabel.text = appHighlight.empresa
                descriptionLabel.text = appHighlight.descricao

                imageView.sd_setImage(with: URL(string: appHighlight.imagemUrl), completed: nil)
            }
        }
    }

    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 12)
    let descriptionLabel: UILabel = .textLabel(text: "App description", fontSize: 20, numberOfLine: 2)
    let imageView: UIImageView = .screenshotImageView()

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
