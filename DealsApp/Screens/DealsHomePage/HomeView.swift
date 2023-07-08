//////
//////  ContentView.swift
//////  DealsApp
//////
//////  Created by Syed Raza on 7/3/23.
//
//
import SwiftUI
struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var expandedDealIDs: Set<String> = []

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.deals.isEmpty {
                    ProgressView()
                } else {
                    List(viewModel.deals) { deal in
                        NavigationLink(destination: DealDetailView(deal: deal)) {
                            VStack(alignment: .leading) {
                                ZStack(alignment: .topTrailing) {
                                    AsyncImage(url: URL(string: deal.product.image)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    } placeholder: {
                                        PlaceholderImageView()
                                    }
                                    .frame(height: 200)
                                    .cornerRadius(8)
                                    
                                    Text("\(Int.random(in: 15...50))% OFF")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 8)
                                        .background(Color.red)
                                        .cornerRadius(8)
                                        .offset(x: -10, y: 10)
                                }
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                Text("Deal Price: $\(deal.price)")
                                    .font(.system(size: 20))
                                    .foregroundColor(.red)
                                    .bold()
                                    
                                Text(deal.description)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(10)

                                HStack {
                                    HStack {
                                        Image(systemName: "hand.thumbsup")
                                        Text(" \(deal.likes.count)")
                                    }
                                    .font(.headline)
                                    .padding(.bottom, 4)
                                    .onTapGesture {
                                        // Handle tap gesture
                                    }

                                    Spacer()

                                    HStack {
                                        Image(systemName: "hand.thumbsdown")
                                        Text(" \(deal.dislikes.count)")
                                    }
                                    .font(.headline)
                                    .padding(.bottom, 4)
                                    .onTapGesture {
                                        // Handle tap gesture
                                    }

                                    Spacer()

                                    Button(action: {
                                        toggleDealExpansion(deal)
                                    }) {
                                        Image(systemName: "text.bubble")
                                    }
                                    .foregroundColor(.primary)
                                   
                                }

                                if expandedDealIDs.contains(deal.id) {
                                    if deal.comments.isEmpty {
                                        Text("No comments yet")
                                            .foregroundColor(.secondary)
                                    } else {
                                        ForEach(deal.comments) { comment in
                                            VStack(alignment: .leading) {
                                                Text(comment.user.name)
                                                    .font(.subheadline)
                                                    .fontWeight(.bold)
                                                Text(comment.text)
                                                    .font(.subheadline)
                                            }
                                            .padding(.vertical, 4)
                                        }
                                    }
                                }
                            }
                            .padding()
                            
                        }
                    }
                }
            }
            .padding(5)
            .onAppear {
                viewModel.getDeals()
            }
            .navigationBarTitle("Deals")
        }
    }

    private func toggleDealExpansion(_ deal: Deal) {
        if expandedDealIDs.contains(deal.id) {
            expandedDealIDs.remove(deal.id)
        } else {
            expandedDealIDs.insert(deal.id)
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
