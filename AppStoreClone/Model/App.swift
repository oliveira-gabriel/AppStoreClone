import Foundation


struct App: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let avalicao: String?
    let iconeUrl: String
    let screenshotUrls: [String]?
}

struct AppHighlight: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let imagemUrl: String
    let descricao: String
}
