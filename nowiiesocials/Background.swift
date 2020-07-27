//
//  Background.swift
//  nowiiesocials
//
//  Created by user on 27.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct Background<Content: View>: View {
    
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Color.white
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .overlay(content)
    }
    
}
