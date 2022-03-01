import Foundation

class AppService {
    static let shared = AppService()
    let API = "http://localhost/app-store/v1"
    func searchAppsInHighlighted(completion: @escaping([AppHighlight]?, Error?)-> ()) {
        guard let url = URL(string: "\(API)/apps/apps-em-destaque") else {return}

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

    func searchGroup(type: String, completion: @escaping (AppGroup?, Error?) -> ()){
        guard let url = URL(string: "\(API)/apps/\(type)") else {return}

        URLSession.shared.dataTask(with: url){ (data, res ,err ) in

            if let err = err {
                print(err)
                return
            }

            do {
                guard let data = data else {return}

                let apps = try JSONDecoder().decode(AppGroup.self, from: data)

                completion(apps,nil )
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }

    func searchAppId(appId: Int, completion: @escaping (App?, Error?) -> ()){
        guard let url = URL(string: "\(API)/apps/\(appId)") else {return}

        URLSession.shared.dataTask(with: url){ (data, res ,err ) in

            if let err = err {
                print(err)
                return
            }

            do {
                guard let data = data else {return}

                let app = try JSONDecoder().decode(App.self, from: data)

                completion(app,nil )
            } catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
