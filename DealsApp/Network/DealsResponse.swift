//
//  DealsResponse.swift
//  DealsApp
//
//  Created by Syed Raza on 7/3/23.
//
//
//struct DealsResponse: Decodable {
//    let data: DealsData
//}
//
//struct DealsData: Decodable, Identifiable {
//    let id: String
//    let title: String
//    let url: String
//    let price: Int
//    let description: String
//    let product: Product
//    let createdAt: String
//    let updatedAt: String
//    let likes: [LikedDeal]
//}
//
//struct Product: Decodable {
//    let availability: String
//    let image: String
//    let description: String
//    let sku: String
//    let updatedAt: String
//}
//
//struct LikedDeal: Decodable {
//    let id: String
//    let user: User
//}
//
//struct User: Decodable {
//    let id: String
//    let name: String
//    let likes: [LikedDeal]
//}

struct Response: Codable {
    let data: DealsData
}

struct DealsData: Codable {
    let deals: [Deal]
}

struct Deal: Decodable, Identifiable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let description: String
    let product: Product
    let createdAt: String
    let updatedAt: String
    let likes: [LikedDeal]
    let dislikes: [DislikedDeal]
    let comments: [Comment]
}

struct Product: Codable {
    let availability: String
    let image: String
    let description: String
    let sku: String
    let updatedAt: String
}

struct LikedDeal: Decodable {
    let id: String
    let deal: Deal
}

struct DislikedDeal: Codable {
    let id: String
    let deal: Deal
}

struct Comment: Codable, Identifiable {
    let id: String
    let createdAt: String
    let text: String
    let user: User
}

struct User: Codable {
    let id: String
    let name: String
}
