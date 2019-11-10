//
//  LandmarkList.swift
//  nowiiesocials
//
//  Created by user on 06.11.2019.
//  Copyright © 2019 Ski, LLC. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
//    @State var showFavoritesOnly = true
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: ContentView(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
        .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        .environmentObject(UserData())
    }
}
