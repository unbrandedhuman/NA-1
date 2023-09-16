//
//  Block.swift
//  NA-1
//
//  Created by Matthew Smith on 8/31/23.
//

import Foundation


enum BlockType: String, Codable {
    case body
    case heading1
    case heading2
    case heading3
    case heading4
    case bullet
    case contentLink
}

struct Block: Codable, Identifiable {
    let id: String
    let type: BlockType
    var content: String
    let prev: String?
    let next: String?
    let graveyard: Bool
    let createdAt: Date
    let modifiedAt: Date
    let document: Document
    
    init(id: String, type: BlockType, content: String, prev: String?, next: String?, graveyard: Bool, createdAt: Date, modifiedAt: Date, document: Document) {
        self.id = id
        self.type = type
        self.content = content
        self.prev = prev
        self.next = next
        self.graveyard = graveyard
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.document = document
    }
}
