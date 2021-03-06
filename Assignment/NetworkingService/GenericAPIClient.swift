//
//  APIService.swift


import Foundation

enum APIError: String, Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}

protocol APIClientProtocol {
    func fetchInfo<T: Decodable>(_ type: APIEndPoint, decode: @escaping (Decodable) -> T?, complete:@escaping (Result<T,APIError> )->())
}

extension APIClientProtocol {
    func fetchInfo<T: Decodable>(_ type: APIEndPoint, decode: @escaping (Decodable) -> T?, complete completion: @escaping (Result<T, APIError>) -> Void) {
        let sourcesURL = URL(string: "https://restcountries.eu/rest/v2/all/")!
        URLSession.shared.dataTask(with: sourcesURL) { data, response, error in
            
            if let _ = error {
                completion(.failure(.clientError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let value = try decoder.decode([RestcountriesModel].self, from: data)
                if let result = decode(value){
                    completion(.success(result))
                }
            }catch{
                completion(.failure(.dataDecodingError))
            }
            
        }.resume()
    }
}

