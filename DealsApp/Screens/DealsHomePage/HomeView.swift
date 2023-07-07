//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI
struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
          
            
            if viewModel.deals.isEmpty {
                ProgressView() // Show a loading indicator while fetching deals
            } else {
                List(viewModel.deals) { deal in
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
            viewModel.getDeals()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
