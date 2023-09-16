//
//  NewWorkspace.swift
//  NA-1
//
//  Created by Matthew Smith on 8/31/23.
//

import SwiftUI

struct Sidebar: View {
    @EnvironmentObject var maestro: Maestro
    @State var workspaceName = ""
    
    @State var displayNewWorkspace = false
    var body: some View {
        if displayNewWorkspace {
            NewWorkspace()
        } else {
            VStack {
                ForEach(maestro.workspaces, id: \.id) { workspace in
                    Button {
                        maestro.currentWorkspace = workspace
                    } label: {
                        Text(workspace.title)
                    }
                }
                
                Text(maestro.currentWorkspace?.title ?? "NO WORKSPACE")
                
                Spacer()
                
                if maestro.currentWorkspace != nil {
                    if maestro.currentWorkspace?.documents != nil {
                        ForEach(maestro.currentWorkspace!.documents, id: \.id) { document in
                            Button {
                                maestro.currentDocument = document
                            } label: {
                                Text(document.title)
                            }
                        }
                    }
                }
            }
        }
        
        Button {
            displayNewWorkspace.toggle()
        } label: {
            Image(systemName: "plus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
        }.buttonStyle(.plain)

    }
}

struct NewWorkspace: View {
    @EnvironmentObject var maestro: Maestro
    @State var workspaceName = ""
    @State var documentName = ""
    var body: some View {
        
        TextField("Name your workspace.", text: $workspaceName)
        
        Button {
            maestro.createWorkspace(title: workspaceName, user: "TEST USER")
        } label: {
            Text("Make new workspace.")
        }
        
        TextField("Name your Document.", text: $documentName)
        
        Button {
            maestro.addDocument(title: documentName)
        } label: {
            Text("Make new document.")
        }
    }
}

#Preview {
    Sidebar()
}
