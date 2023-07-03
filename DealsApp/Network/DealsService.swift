//
//  DealsService.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation

enum APIError: Error {
    case invalidUrl, decodingError
}










class DealsService {
    func fetchDeals() throws -> [Deal] {
        guard let url = Bundle.main.url(forResource: "getDealsWithAugments", withExtension: "json") else {
            throw APIError.invalidUrl
        }
        
        let data = try Data(contentsOf: url)
        
        do {
            let result = try JSONDecoder().decode(DealsResponse.self, from: data)
            return result.data.deals
        } catch {
            throw APIError.decodingError
        }
    }
}
