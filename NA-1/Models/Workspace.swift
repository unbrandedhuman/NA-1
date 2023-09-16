//
//  Workspace.swift
//  NA-1
//
//  Created by Matthew Smith on 8/30/23.
//

import Foundation
import SwiftData

class Workspace: Codable {
    let id: String
    let title: String
    let createdAt: Date
    let modifiedAt: Date
    let user: String
    let labels: [Label]
    var documents: [Document]
    
    init(id: String, title: String, createdAt: Date, modifiedAt: Date, user: String, labels: [Label], documents: [Document]) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.user = user
        self.labels = labels
        self.documents = documents
    }
}
