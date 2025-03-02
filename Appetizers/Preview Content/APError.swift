//
//  APError.swift
//  Appetizers
//
//  Created by Berkay on 2.03.2025.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case decodingFailed
}
