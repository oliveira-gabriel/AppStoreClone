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
}
