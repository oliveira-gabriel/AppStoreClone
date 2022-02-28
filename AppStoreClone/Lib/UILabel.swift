
import UIKit


extension UILabel {
    static func textLabel(text: String, fontSize: CGFloat, numberOfLine: Int = 1) -> UILabel {
        let label = UILabel()

        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = numberOfLine
        label.text = text

        return label
    }
}
