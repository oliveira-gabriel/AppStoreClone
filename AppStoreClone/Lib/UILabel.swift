
import UIKit


extension UILabel {

    // metodos para criar label com padroes definidos
    static func textLabel(text: String, fontSize: CGFloat, numberOfLine: Int = 1) -> UILabel {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLine
        label.text = text

        return label
    }
    static func textBoldLabel(text: String, fontSize: CGFloat, numberOfLine: Int = 1) -> UILabel {
        let label = UILabel()

        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLine
        label.text = text

        return label
    }
}
