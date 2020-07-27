//
//  RegBioTextFieldBait.swift
//  nowiiesocials
//
//  Created by user on 08.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct RegBioTextFieldBait: View {
    
    var fieldText: String = ""

    var scoreRating: Int {
        if fieldText.count > Int(maxAvailableChars * 0.85) {
            return 3
        } else if fieldText.count > Int(maxAvailableChars * 0.55) {
            return 2
        } else if fieldText.count > Int(maxAvailableChars * 0.3) {
            return 1
        } else {
            return 0
        }
    }
    var maxAvailableChars: Double = 140.0
    
    
    init(fieldText: String) {
        self.fieldText = fieldText
    }
    
    var body: some View {
        HStack {
            BaitScoreView(rating: scoreRating)
            Spacer()
            Text("\(fieldText.count)/\(Int(maxAvailableChars))")
                .font(Font.custom("NowieVremena-Light", size: 14))
                .foregroundColor(Color.hex("C9C9C9"))
        }
    }
}

struct RegBioTextFieldBait_Previews: PreviewProvider {
    static var previews: some View {
        RegBioTextFieldBait(fieldText: "sample text")
//        .frame(height: 25)
    }
}
