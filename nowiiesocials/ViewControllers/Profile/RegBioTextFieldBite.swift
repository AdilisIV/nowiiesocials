//
//  RegBioTextFieldBait.swift
//  nowiiesocials
//
//  Created by user on 08.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct RegBioTextFieldBait: View {
    
    @State var charactersAmount: Int
    var maxAvailableChars: Double = 140.0
    
    var scoreRating: Int {
        if charactersAmount == 0 {
            return 0
        } else if charactersAmount > Int(maxAvailableChars * 0.3) {
            return 1
        } else if charactersAmount > Int(maxAvailableChars * 0.55) {
            return 2
        } else if charactersAmount > Int(maxAvailableChars * 0.85) {
            return 3
        } else {
            return 3
        }
    }
    
    var body: some View {
        HStack {
            BaitScoreView(rating: scoreRating)
            Spacer()
            Text("\(charactersAmount)/\(Int(maxAvailableChars))")
                .font(Font.custom("NowieVremena-Light", size: 14))
                .foregroundColor(Color.hex("C9C9C9"))
        }
    }
}

struct RegBioTextFieldBait_Previews: PreviewProvider {
    static var previews: some View {
        RegBioTextFieldBait(charactersAmount: 0)
//        .frame(height: 25)
    }
}
