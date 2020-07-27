//
//  AuthFeatureCard.swift
//  nowiiesocials
//
//  Created by user on 11.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct AuthFeatureCard: View {
    
    typealias FeatureNote = (image: String, title: String)
    var note: FeatureNote
    
    var body: some View {
        VStack {
            Image(note.image)
            .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
                .frame(height: 16.0)
            HStack {
                Spacer()
                    .frame(width: 16.0)
                Text(note.title)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Spacer()
                    .frame(width: 16.0)
            }
        }
    }
}

struct AuthFeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        AuthFeatureCard(note: AuthFeatureCard.FeatureNote("walktrough_artwork_1", "Новые встречи за завтраком они в открытости новым людям и идеям без ожиданий, обид и бесконечных переписок"))
    }
}
