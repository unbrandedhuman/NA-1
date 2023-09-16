//
//  Label.swift
//  NA-1
//
//  Created by Matthew Smith on 8/30/23.
//

import Foundation
import SwiftUI

struct Label: Equatable, Hashable, Codable {
    
    let id: String
    let title: String
    let color: LabelPalette
    let workspace: String
    let user: String
    let createdAt: Date
    let modifiedAt: Date
    
    init(id: String, title: String, color: LabelPalette, workspace: String, user: String, createdAt: Date, modifiedAt: Date) {
        self.id = id
        self.title = title
        self.color = color
        self.workspace = workspace
        self.user = user
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }

}

enum LabelPalette: String, Codable {
    case primary, purple, red, lightPurple, pink, limeGreen, darkOrange, lightOrange
    
    func getColor() -> Color {
        switch self {
        case .primary:
            return LabelColor.primary
        case .purple:
            return LabelColor.purple
        case .red:
            return LabelColor.red
        case .lightPurple:
            return LabelColor.lightPurple
        case .pink:
            return LabelColor.pink
        case .limeGreen:
            return LabelColor.limeGreen
        case .darkOrange:
            return LabelColor.darkOrange
        case .lightOrange:
            return LabelColor.lightOrange
        }
    }
    
    static func allCases() -> [LabelPalette] {
        return [primary, purple, red, lightPurple, pink, limeGreen, darkOrange, lightOrange]
    }
}

struct LabelColor {
    static let primary = Color(red: 94.0 / 255.0, green: 129.0 / 255.0, blue: 255.0 / 255.0)
    static let purple = Color(red: 139.0 / 255.0, green: 94.0 / 255.0, blue: 255.0 / 255.0)
    static let red = Color(red: 255.0 / 255.0, green: 94.0 / 255.0, blue: 129.0 / 255.0)
    static let lightPurple = Color(red: 255.0 / 255.0, green: 94.0 / 255.0, blue: 210.0 / 255.0)
    static let pink = Color(red: 255.0 / 255.0, green: 117.0 / 255.0, blue: 179.0 / 255.0)
    static let limeGreen = Color(red: 94.0 / 255.0, green: 255.0 / 255.0, blue: 139.0 / 255.0)
    static let darkOrange = Color(red: 255.0 / 255.0, green: 152.0 / 255.0, blue: 129.0 / 255.0)
    static let lightOrange = Color(red: 255.0 / 255.0, green: 201.0 / 255.0, blue: 98.0 / 255.0)
    
    static let allColors: [SwiftUI.Color] = [
        LabelColor.primary,
        LabelColor.purple,
        LabelColor.red,
        LabelColor.lightPurple,
        LabelColor.pink,
        LabelColor.limeGreen,
        LabelColor.darkOrange,
        LabelColor.lightOrange,
    ]
}
