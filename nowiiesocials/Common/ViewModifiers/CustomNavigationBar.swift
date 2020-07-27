//
//  CustomNavigationBar.swift
//  nowiiesocials
//
//  Created by user on 27.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomNavigationBar: ViewModifier {
    
    func body(content: Content) -> some View {
        NavigationView {
            content
        }
        .onAppear(perform: self.customNavigationBar)
    }
    
    private func customNavigationBar() {
        let customTab = UINavigationBarAppearance()
        let navigationBar = UINavigationBar.appearance()
        
        customTab.backgroundColor = .white
        customTab.shadowImage = UIImage()
        customTab.shadowColor = .clear
        
        customTab.largeTitleTextAttributes = [.font : UIFont(name: "NowieVremena-Light", size: 34)!]
        navigationBar.standardAppearance = customTab
        navigationBar.scrollEdgeAppearance = customTab
        navigationBar.compactAppearance = customTab
    }
}

extension View {
    func customNavigationBar() -> some View {
        ModifiedContent(content: self, modifier: CustomNavigationBar())
    }
}
