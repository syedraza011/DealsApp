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
        guard let url = Bundle(for: type(of: self)).url(forResource: "getDealsWithAugments", withExtension: "json") else {
            throw APIError.invalidUrl
        }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(DealsResponse.self, from: data)
            return result.data.deals
        } catch {
            throw APIError.decodingError
        }
    }

}
