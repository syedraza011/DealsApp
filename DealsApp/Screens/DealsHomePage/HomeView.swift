////
////  ContentView.swift
////  DealsApp
////
////  Created by Syed Raza on 7/3/23.

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var selectedDeal: Deal?

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.deals.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.deals) { deal in
                        NavigationLink(destination: DealDetailView(deal: deal)) {
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: deal.product.image)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    PlaceholderImageView()
                                }
                                .frame(height: 200)
                                .cornerRadius(8)

                                Text(deal.title)
                                    .font(.headline)
                                    .lineLimit(2)

                                Text(deal.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                viewModel.getDeals()
            }
            .navigationBarTitle("Deals")
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Color.gray
            .frame(height: 200)
            .cornerRadius(8)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}







