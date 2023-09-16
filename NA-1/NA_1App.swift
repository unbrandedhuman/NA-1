//
//  NA_1App.swift
//  NA-1
//
//  Created by Matthew Smith on 8/30/23.
//

import SwiftUI

@main
struct NA_1App: App {
    @StateObject var maestro = Maestro()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(maestro)
        }.windowToolbarStyle(.unified)
    }
}
