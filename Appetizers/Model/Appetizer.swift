//
//  Appetizer.swift
//  Appetizers
//
//  Created by Berkay on 1.03.2025.
//

import Foundation

struct Appetizer: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer One",
                                           description: "This is the description of my appetizer. It is yummy",
                                           price: 9.99,
                                           imageURL: "",
                                           calories: 99,
                                           protein: 99,
                                           carbs: 99)
    
    static let sampleAppetizer1 = Appetizer(id: 0002,
                                            name: "Test Appetizer Two",
                                            description: "This is the description of my appetizer. It is yummy",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 99,
                                            protein: 99,
                                            carbs: 99)
    
    static let sampleAppetizer2 = Appetizer(id: 0003,
                                            name: "Test Appetizer Three",
                                            description: "This is the description of my appetizer. It is yummy",
                                            price: 9.99,
                                            imageURL: "",
                                            calories: 99,
                                            protein: 99,
                                            carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer1, sampleAppetizer2]
}
