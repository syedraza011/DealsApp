//
//  HomeViewModel.swift
//  DealsApp
//
//  Created by Syed Raza on 7/3/23.


import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var deals: [Deal] = []
    
    let service = DealsService()
    
    func getDeals() {
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



//import Foundation
//import SwiftUI
//
//class HomeViewModel: ObservableObject {
//    @Published var deals: [Deal] = []
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

