//
//  Environment.swift
//  MeteoriteRecordApp
//
//  Created by 李祺 on 07/03/2020.
//  Copyright © 2020 Lee. All rights reserved.
//

import Foundation

enum Environment {
    
    case development
    case staging
    case production
    
    var isDevelopment: Bool { return self == .development }
    var isStaging: Bool { return self == .staging }
    var isProduction: Bool { return self == .production }
    
    var baseUrl:String{
        switch self {
        case .development:
            return "https://restcountries.eu/"
        case .staging:
            return "https://restcountries.eu/"
        case .production:
            return "https://restcountries.eu/"
        }
    }
}
