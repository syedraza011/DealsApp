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

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: deal.product.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                    case .failure:
                        Image(systemName: "xmark.circle")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .frame(height: 200)
                            .cornerRadius(8)
                    @unknown default:
                        EmptyView()
                    }
                }

                Text(deal.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()

                Text(deal.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)

                Text("Price: $\(deal.price)")
                    .font(.headline)
                    .foregroundColor(.green)

                Text("Availability: \(deal.product.availability)")
                    .font(.headline)
                    .foregroundColor(.blue)

                Text("Updated At: \(deal.product.updatedAt)")
                    .font(.headline)
                    .foregroundColor(.gray)

                // Likes
                VStack(alignment: .leading) {
                    Text("Likes:")
                        .font(.headline)
                        .padding(.bottom, 4)

                    if deal.likes.isEmpty {
                        Text("No likes yet")
                            .foregroundColor(.secondary)
                    } else {
                        Text("\(deal.likes.count) people liked this")
                            .foregroundColor(.secondary)
                            .onTapGesture {
                                // Toggle logic to show/hide individual names
                            }
                    }
                }

                // Dislikes
                VStack(alignment: .leading) {
                    Text("Dislikes:")
                        .font(.headline)
                        .padding(.bottom, 4)

                    if deal.dislikes.isEmpty {
                        Text("No dislikes yet")
                            .foregroundColor(.secondary)
                    } else {
                        Text("\(deal.dislikes.count) people disliked this")
                            .foregroundColor(.secondary)
                            .onTapGesture {
                                // Toggle logic to show/hide individual names
                            }
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
}

