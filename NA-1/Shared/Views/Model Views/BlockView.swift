//
//  BlockView.swift
//  NA-1
//
//  Created by Matthew Smith on 8/31/23.
//

import SwiftUI

struct BlockView: View {
    var block: Block
    @State var text = ""
    @EnvironmentObject var maestro: Maestro
    var body: some View {
        VStack {
            switch block.type {
            case .body:
                TextEditor(text: $text)
                    .font(.body)
                    .onAppear {
                        text = block.content
                    }
                    .onChange(of: text) {
                        print($0)
                        Task {
                            let block = Block(id: block.id, type: block.type, content: text, prev: block.prev, next: block.next, graveyard: block.graveyard, createdAt: block.createdAt, modifiedAt: Date(), document: block.document)
                            try await maestro.blockStore.remove(self.block)
                            try await maestro.blockStore.insert(block)
                            print(block)
                        }
                    }
            case .heading1:
                TextEditor(text: $text)
                    .font(.largeTitle)
                    .onAppear {
                        text = block.content
                    }
                    .onChange(of: text) {
                        print($0)
                        Task {
                            try await maestro.blockStore.remove(block)
                            try await maestro.blockStore.insert(block)
                        }
                    }
            case .heading2:
                TextEditor(text: $text)
                    .font(.title)
                    .onAppear {
                        text = block.content
                    }
                    .onChange(of: text) {
                        print($0)
                        Task {
                            try await maestro.blockStore.remove(block)
                            try await maestro.blockStore.insert(block)
                        }
                    }
            case .heading3:
                TextEditor(text: $text)
                    .font(.title2)
                    .onAppear {
                        text = block.content
                    }
                    .onChange(of: text) {
                        print($0)
                        Task {
                            try await maestro.blockStore.remove(block)
                            try await maestro.blockStore.insert(block)
                        }
                    }
            case .heading4:
                TextEditor(text: $text)
                    .font(.title3)
                    .onAppear {
                        text = block.content
                    }
                    .onChange(of: text) {
                        print($0)
                        Task {
                            try await maestro.blockStore.remove(block)
                            try await maestro.blockStore.insert(block)
                        }
                    }
            case .bullet:
                TextEditor(text: $text)
                    .onAppear {
                        text = block.content
                    }
                    .onChange(of: text) {
                        print($0)
                        Task {
                            try await maestro.blockStore.remove(block)
                            try await maestro.blockStore.insert(block)
                        }
                    }
            case .contentLink:
                TextEditor(text: $text)
                    .onAppear {
                        text = block.content
                    }
                    .onChange(of: text) {
                        print($0)
                        Task {
                            try await maestro.blockStore.remove(block)
                            try await maestro.blockStore.insert(block)
                        }
                    }
            }
        }
    }
}
