import Foundation

class AppService {
    static let shared = AppService()

    func searchAppsInHighlighted() {
        guard let url = URL(string: "http://localhost/app-store/v1/apps/apps-em-destaque") else {return}

        URLSession.shared.dataTask(with: url){ (data, res ,err ) in

            if let err = err {
                print(err)
                return
            }

            print(data)
        }.resume()
    }
}
