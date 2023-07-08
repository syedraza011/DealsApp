//
//  DealDetailsView.swift
//  DealsApp
//
//  Created by Syed Raza on 7/7/23.
//
import SwiftUI
import URLImage

struct DealDetailView: View {
    let deal: Deal
    let discountPercentage: Int

    init(deal: Deal) {
        self.deal = deal
        self.discountPercentage = Int.random(in: 18...30)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack(alignment: .topTrailing) {
                    if let imageUrl = URL(string: deal.product.image) {
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure:
                                Image(systemName: "xmark.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                                Text("Missing Image")
                            @unknown default:
                                EmptyView()
                                Text("Missing Image")
                            }
                        }
                        .frame(height: 200)
                    } else {
                        Color.gray
                            .frame(height: 200)
                    }

                    if showDiscountBanner {
                        VStack {
                            Text("-\(discountPercentage)%")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(Color.green)
                                .cornerRadius(8)
                        }
                        .padding(16)
                        .opacity(1)
                    }
                }

                Text(deal.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Price: $\(deal.price)")
                    .font(.headline)
                    .foregroundColor(.green)
                Text(deal.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

              

                Text("Availability: \(deal.product.availability)")
                    .font(.headline)
                    .foregroundColor(.blue)

                Text("Updated At: \(deal.product.updatedAt)")
                    .font(.headline)
                    .foregroundColor(.gray)

                // Likes
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text(" \(deal.likes.count)")
                        .font(.headline)
                        .padding(.bottom, 4)
                        .onTapGesture {
                            // Show/hide individual names logic
                        }
                

                // Dislikes
              
                    Image(systemName: "hand.thumbsdown")
                    Text(" \(deal.dislikes.count)")
                        .font(.headline)
                        .padding(.bottom, 4)
                        .onTapGesture {
                            // Show/hide individual names logic
                        }
                }

                // Comments
                VStack(alignment: .leading) {
                    Text("Comments:")
                        .font(.headline)
                        .padding(.bottom, 4)

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

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Deal Details", displayMode: .inline)
    }

    private var showDiscountBanner: Bool {
        if let imageUrl = URL(string: deal.product.image) {
            return imageIsSmall(imageUrl: imageUrl) || !imageExists(imageUrl: imageUrl)
        }
        return true
    }

    private func imageIsSmall(imageUrl: URL) -> Bool {
        return true
    }

    private func imageExists(imageUrl: URL) -> Bool {
        
        return false
    }
}


