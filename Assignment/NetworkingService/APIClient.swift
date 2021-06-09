//
//  APIClient.swift
//  MeteoriteRecordApp
//
//  Created by 李祺 on 12/03/2020.
//  Copyright © 2020 Lee. All rights reserved.
//

import Foundation

class APIClient: APIClientProtocol {
    
    func getListInfo(from type: APIEndPoint, completion: @escaping (Result<[RestcountriesModel], APIError>) -> Void){
        fetchInfo(type, decode: {
            json -> [RestcountriesModel]? in
            guard let result = json as? [RestcountriesModel] else { return  nil }
            return result
        }, complete: completion)
    }
}
