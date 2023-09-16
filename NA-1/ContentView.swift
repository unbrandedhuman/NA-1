//
//  ContentView.swift
//  NA-1
//
//  Created by Matthew Smith on 8/30/23.
//

import SwiftUI
import DesignSystem

struct ContentView: View {
    @EnvironmentObject var maestro: Maestro
    var body: some View {
        NavigationSplitView(sidebar: {
            Sidebar().padding()
        }, detail: {
            if maestro.currentDocument != nil {
                DocumentView(doc: maestro.currentDocument!)
            } else {
                Text("No selected document.")
                ForEach(maestro.blocks) { block in
                    Text(block.content)
                }
            }
        }).toolbar {
            ToolbarItem(placement: .navigation) {
                Text(maestro.currentDocument?.title ?? "No document selected.").font(Font.DesignSystem.headline3)
            }
        }
        .navigationTitle("")
    }
}

#Preview {
    ContentView()
}
