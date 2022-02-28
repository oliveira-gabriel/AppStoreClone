import Foundation

class AppService {
    static let shared = AppService()

    func searchAppsInHighlighted(completion: @escaping([AppHighlight]?, Error?)-> ()) {
        guard let url = URL(string: "http://localhost/app-store/v1/apps/apps-em-destaque") else {return}

        URLSession.shared.dataTask(with: url){ (data, res ,err ) in

            if let err = err {
                print(err)
                return
            }

            do {
                guard let data = data else {return}

                let apps = try JSONDecoder().decode([AppHighlight].self, from: data)

                completion(apps,nil )
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
