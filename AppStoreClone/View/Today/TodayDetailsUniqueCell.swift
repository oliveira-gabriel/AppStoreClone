import UIKit


class TodayDetailsUniqueCell: UITableViewCell {

    let descriptionLabel: UILabel = {
        let label = UILabel()

        let textAtrr = NSMutableAttributedString(string: "Lorem ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        textAtrr.append(NSMutableAttributedString(string: "Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum Lorem ipsum lorem ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray]))


        label.attributedText = textAtrr
        label.font = UIFont.systemFont(ofSize: 14)

        label.numberOfLines = 0

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}
