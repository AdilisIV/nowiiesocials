//
//  DatingStatusNote.swift
//  nowiiesocials
//
//  Created by user on 28.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct DatingStatusNote: View {
    
    var note: String
    
    var body: some View {
        Text(note)
            .font(Font.custom("NowieVremena-Light", size: 24))
        .lineSpacing(8)
            .multilineTextAlignment(.center)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct DatingStatusNote_Previews: PreviewProvider {
    static var previews: some View {
        DatingStatusNote(note: "Хочу познакомиться с коллегами из смежных сфер, такими же крутыми, как я")
    }
}
