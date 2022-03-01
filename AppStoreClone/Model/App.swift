import Foundation

// MODELS 
struct App: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let avalicao: String?
    let iconeUrl: String
    let screenshotUrls: [String]?
    let descricao: String?
    let comentarios: [AppComment]?
}

struct AppHighlight: Decodable {
    let id: Int
    let nome: String
    let empresa: String
    let imagemUrl: String
    let descricao: String
}


struct AppGroup: Decodable {
    let id: String
    let titulo: String
    let apps: [App]
}

struct AppComment: Decodable {
    let id: Int
    let titulo: String
    let avaliacao: Int
    let descricao: String
}
