//
//  DealsService.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidUrl
    case decodingError
}

class DealsService {
    func fetchDeals() throws -> [Deal] {
        guard let url = Bundle.main.url(forResource: "getDealsWithAugments", withExtension: "json") else {
            throw APIError.invalidUrl
        }
        
        let data = try Data(contentsOf: url)
        
        do {
            let response = try JSONDecoder().decode(DealsResponse.self, from: data)
            return response.data.deals
        } catch {
            throw APIError.decodingError
        }
    }
}
