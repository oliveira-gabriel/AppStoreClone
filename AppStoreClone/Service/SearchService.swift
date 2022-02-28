import UIKit


class SearchService {
    static let shared = SearchService()
    
    func searchApps(text: String, completion: @escaping ([App]?, Error?) ->()) {
        guard let url = URL(string: "http://localhost/app-store/v1/apps?search=\(text)") else {return}

        URLSession.shared.dataTask(with: url){ (data, res, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            do {
                guard let data = data else {return}

                let apps = try JSONDecoder().decode([App].self, from: data)

                completion(apps,nil )
            }catch let err {
                completion(nil, err)
                return
            }
        }.resume()
    }
}
