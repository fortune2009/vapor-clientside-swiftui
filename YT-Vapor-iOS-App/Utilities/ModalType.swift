//
//  ModalType.swift
//  YT-Vapor-iOS-App
//
//  Created by Fortune David Chigozirim on 12/06/2024.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update(Song)
}
