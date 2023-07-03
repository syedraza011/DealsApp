//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import Foundation

//class HomeViewModel: ObservableObject {
//    // Call the fetch call using DealsService
//    let service = DealsService()
//
//    @MainActor func getDeals () {
//        Task {
//            do {
//                let deal = try await service.fetchDeals()
//
//            }
//        }
//    }
//
//}
import SwiftUI
// struct that holds the deal information
struct Deal: Identifiable {
    let id: String
    let title: String
    let url: URL
    let price: Double
    let description: String
}

class HomeViewModel: ObservableObject {
    @Published var deals: [Deal] = []
    
    let service = DealsService()
    
    @MainActor func getDeals() {
        Task {
            do {
                let deals = try await service.fetchDeals()
                DispatchQueue.main.async {
                    self.deals = deals
                }
            } catch {
                // Handle any errors that occurred during the fetching process
                print("Error fetching deals: \(error)")
            }
        }
    }
}

//// struct that holds that location's weather
//struct MockDeals: Identifiable {
//    let id = UUID()
//    var response: WeatherResponse
//    init(response: WeatherResponse) {
//        self.response = response
//    }
//}
//class HomeViewModel: ObservableObject {
//    @Published var deals: [Deal] = Deal( id: "1", title: "My Arcade All-Star Stadium Pico Player, Universal", url: "https://www.officedepot.com/a/products/9025577/My-Arcade-All-Star-Stadium-Pico/", price: 1999,
//        "description": "What a fantastic price on a must-have product - you should totally buy this right now!" // Assuming you have a Deal struct or class defined
//
//    let service = DealsService()
//
//    @MainActor func getDeals() {
//        Task {
//            do {
//                let deals = try await service.fetchDeals()
//                DispatchQueue.main.async {
//                    self.deals = deals
//                }
//            } catch {
//                // Handle any errors that occurred during the fetching process
//                print("Error fetching deals: \(error)")
//            }
//        }
//    }
//}
