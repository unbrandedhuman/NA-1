//
//  Maestro.swift
//  NA-1
//
//  Created by Matthew Smith on 8/31/23.
//

import Foundation
import SwiftUI
import Boutique
import DesignSystem

@MainActor class Maestro: ObservableObject {
    let workspaceStore = Store<Workspace>(
        storage: SQLiteStorageEngine.default(appendingPath: "Workspaces"),
        cacheIdentifier: \.id
    )
    let documentStore = Store<Document>(
        storage: SQLiteStorageEngine.default(appendingPath: "Documents"),
        cacheIdentifier: \.id
    )
    let blockStore = Store<Block>(
        storage: SQLiteStorageEngine.default(appendingPath: "Blocks"),
        cacheIdentifier: \.id
    )
    
    /// Arrays
    @Published var workspaces = [Workspace]()
    @Published var blocks = [Block]()
    
    ///Current Objects selected
    @Published var currentWorkspace: Workspace?
    @Published var currentDocument: Document?
    
    init(workspaces: [Workspace] = [Workspace](), blocks: [Block] = [Block](), currentWorkspace: Workspace? = nil, currentDocument: Document? = nil) {
        self.workspaces = workspaces
        self.blocks = blocks
        self.currentWorkspace = currentWorkspace
        self.currentDocument = currentDocument
        
        Task {
            let storedWorkspaces = await workspaceStore.items
            self.workspaces = storedWorkspaces
            
            let storedBlocks = await blockStore.items
            self.blocks = storedBlocks
            print(storedBlocks)
        }
        
        
    }
    
    /// Create new workspace and create the first document.
    /// - Parameters:
    ///   - title: the name of the workspace visible to the user
    ///   - user: the name of the user (May be changed to an ID
    func createWorkspace(title: String, user: String) {
        /// The workspace being created
        let newWorkspace = Workspace(id: UUID().uuidString, title: title, createdAt: Date(), modifiedAt: Date(), user: user, labels: [], documents: [])
        /// Add workspace to global workspaces
//        workspaces.append(newWorkspace)
//        currentWorkspace = newWorkspace
//        print("DEBUG: NEW WORKSPACE CREATED. WORKSPACE ID: \(newWorkspace.id)")
//        print("DEBUG: WORKSPACE SELECTED: \(String(describing: currentWorkspace?.id))")
        /// Create document and assign to this workspace
//        addDocument(title: "\(title)'s First Document")
        
        Task {
            currentWorkspace = newWorkspace
            addDocument(title: "\(title)'s First Document")
            try await workspaceStore.insert(newWorkspace)
            workspaces = workspaceStore.items
            print(workspaceStore.items)
        }
    }
    
    /// Create document under the parent workspace (currently selected)
    /// - Parameter title: the name of the document visible to the user
    func addDocument(title: String) {
        /// The doc being added
        let newDoc = Document(id: UUID().uuidString, title: title, focused: nil, createdAt: Date(), modifiedAt: Date(), workspace: currentWorkspace!.id)
        
        /// Add doc to workspace
        currentWorkspace!.documents.append(newDoc)
        
        /// Set doc as current
        currentDocument = newDoc
        
        /// Call function to add block to maestro with current document
        addBlock(content: "New Block")
    }
    
    func addBlock(content: String) {
        let newBlock = Block(id: UUID().uuidString, type: .body, content: content, prev: nil, next: nil, graveyard: false, createdAt: Date(), modifiedAt: Date(), document: currentDocument!)
        
        /// Add block to Maestro
//        blocks.append(newBlock)
        Task {
            try await blockStore.insert(newBlock)
            blocks = blockStore.items
        }
    }
    
    
}
