//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @State var dealsService = DealsService()
    @State private var deals: [Deal] = []
    
    var body: some View {
        Text("Hello")
        VStack {
            if deals.isEmpty {
                ProgressView() // Show a loading indicator while fetching deals
            } else {
                List(deals) { deal in
                    Text(deal.title)
                        .font(.headline)
                    Text(deal.description)
                        .font(.subheadline)
                    // Add more views to display other deal information
                }
            }
        }
        .padding()
        .onAppear {
            fetchDeals()
        }
    }
    
    private func fetchDeals() {
        do {
            deals = try dealsService.fetchDeals()
        } catch {
            // Handle error while fetching deals
            print("Error: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
