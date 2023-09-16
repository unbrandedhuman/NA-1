//
//  Document.swift
//  NA-1
//
//  Created by Matthew Smith on 8/30/23.
//

import Foundation

enum DocumentError: Error {
    case noWorkspace
}

public struct Document: Equatable, Codable {
    public let id: String
    public let title: String
    public let focused: String?
    public let createdAt: Date
    public let modifiedAt: Date
    public let workspace: String
    
    public init(id: String, title: String, focused: String?, createdAt: Date, modifiedAt: Date, workspace: String) {
        self.id = id
        self.title = title
        self.focused = focused
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.workspace = workspace
    }
}

public struct DocumentUpdate: Codable {
    public let id: String
    public let workspace: String
    public let content: Dictionary<String, String>
}
