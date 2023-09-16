//
//  DocumentView.swift
//  NA-1
//
//  Created by Matthew Smith on 8/30/23.
//

import Foundation
import SwiftUI

struct DocumentView: View {
    var doc: Document
    @EnvironmentObject var maestro: Maestro
    var body: some View {
        Text(doc.title)
        
        ForEach(maestro.blocks, id: \.id) { block in
            if block.document == self.doc {
                BlockView(block: block)
            }
        }
    }
}
