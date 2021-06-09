//
//  EndPoint.swift


import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url,cachePolicy: .reloadIgnoringLocalCacheData)
    }
}

enum APIEndPoint {
    
    case listRecords
}

extension APIEndPoint: Endpoint {
    
    var base: String {
        return Environment.development.baseUrl
    }
    
    var path: String {
        switch self {
        case .listRecords: return "rest/v2/all/"
        }
    }
}








