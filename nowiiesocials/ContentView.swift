//
//  ContentView.swift
//  nowiiesocials
//
//  Created by user on 05.11.2019.
//  Copyright © 2019 Ski, LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Show Action Sheet")
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(title: Text("What do you want to do?"), message: Text("There's only one choice..."), buttons: [.default(Text("Dismiss Action Sheet"))])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
