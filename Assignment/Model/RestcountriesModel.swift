//
//  RestcountriesModel.swift
//  Assignment
//
//  Created by Tushar Khopade on 09/06/021.
//

import Foundation

struct RestcountriesModel: Codable {
    var name: String?
    var capital: String?
    var region: String?
    var callingCodes: [String]?
    var population: Int?
    var currencies: [CurrenciesModel]?
    var borders: [String]?
}

struct CurrenciesModel: Codable {
    var code: String?
    var symbol: String?
    var name: String?
}


