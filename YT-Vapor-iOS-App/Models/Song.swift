//
//  Song.swift
//  YT-Vapor-iOS-App
//
//  Created by Fortune David Chigozirim on 29/05/2024.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
