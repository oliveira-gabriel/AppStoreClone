import UIKit


extension UIColor {
    static let blueCustom = UIColor(red: 0/255, green: 118/255, blue: 224/255, alpha: 1)
    static let grayCustom = UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1)
    static let background = UIColor(red: 240/255, green: 240/255, blue: 250/255, alpha: 1)

    static let black = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
          return UIColor(white: 1, alpha: 1.0)
        default:
            return UIColor(white: 0, alpha: 1.0)
        }
      }

    // cria uma cor que adapta ao tema
    static let white = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .dark:
          return UIColor(white: 0.3, alpha: 1.0)
        default:
          return UIColor(white: 1, alpha: 1.0)
        }
      }


    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
      }
}
