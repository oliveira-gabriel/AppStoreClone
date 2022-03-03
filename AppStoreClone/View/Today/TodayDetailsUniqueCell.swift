import UIKit


class TodayDetailsUniqueCell: UITableViewCell {

    let descriptionLabel: UILabel = {
        let label = UILabel()

        let textAtrr = NSMutableAttributedString(string: "Lorem ipsum", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        textAtrr.append(NSAttributedString(string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray]))

        textAtrr.append(NSAttributedString(string: "\n\n De onde ele vem?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))

        textAtrr.append(NSAttributedString(string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray]))

        textAtrr.append(NSAttributedString(string: "\n\n De onde ele vem?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))

        textAtrr.append(NSAttributedString(string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray]))

        textAtrr.append(NSAttributedString(string: "\n\n De onde ele vem?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))

        textAtrr.append(NSAttributedString(string: " é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemGray]))
        

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
