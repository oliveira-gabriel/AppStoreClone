import UIKit


class AppsGroupCell: UICollectionViewCell{


    var group: AppGroup?{
        didSet {
            if let group = group {
                titleLabel.text = group.titulo
                appsGroupHorizontalVC.apps = group.apps
            }
        }
    }

    let titleLabel: UILabel = .textBoldLabel(text: "App grupo", fontSize: 24)

    let appsGroupHorizontalVC = AppsGroupHorizontalVC()


    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)

        titleLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20)
        )
        addSubview(appsGroupHorizontalVC.view)
        appsGroupHorizontalVC.view.fill(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: bottomAnchor,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
