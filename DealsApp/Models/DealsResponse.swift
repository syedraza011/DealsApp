//
//  DealsResponse.swift
//  DealsApp
//
//  Created by Syed Raza on 7/3/23.
//



struct DealsResponse: Decodable {
    let data: Deals
}

struct Deals: Decodable {
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
    let likes: [Like]
    let dislikes: [Dislike]
    let comments: [Comment]
    
    
    static func == (lhs: Deal, rhs: Deal) -> Bool {
          return lhs.id == rhs.id
      }
    
    
    static let example = Deal(
            id: "1",
            title: "Example Deal",
            url: "https://example.com",
            price: 99,
            description: "This is an example deal",
            product: Product.example,
            createdAt: "1234567890",
            updatedAt: "1234567890",
            likes: [],
            dislikes: [],
            comments: []
        )
}

struct Product: Decodable {
    let availability: String
    let image: String
    let description: String
    let sku: String
    let updatedAt: String
    
    static let example = Product(
            availability: "IN STOCK",
            image: "https://example.com/image.jpg",
            description: "This is an example product",
            sku: "123456",
            updatedAt: "1234567890"
        )
}

struct Like: Decodable, Identifiable {
    let id: String
    let user: User
}

struct User: Decodable {
    let id: String?
    let name: String
}

struct Dislike: Decodable, Identifiable {
    let id: String
    let user: User
}

struct Comment: Decodable, Identifiable {
    let id: String
    let createdAt: String
    let text: String
    let user: User
}
