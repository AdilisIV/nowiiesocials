//
//  BaitScoreView.swift
//  nowiiesocials
//
//  Created by user on 08.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct BaitScoreView: View {
    
    var rating: Int
    
    var label = ""
    var maxScore = 3
    var starImage = Image(systemName: "star.fill")
    var activeColor = Color.hex("F7CD53")
    var unactiveColor = Color.hex("C9C9C9")
    
    var body: some View {
        HStack {
            ForEach((1...maxScore), id: \.self) { number in
                self.starImage.foregroundColor(number > self.rating ? self.unactiveColor : self.activeColor)
            }
            Text("\(baitText(for: self.rating))")
                .foregroundColor(.black)
                .font(Font.custom("NowieVremena-Light", size: 14))
                .padding(EdgeInsets(top: 4, leading: 6, bottom: 0, trailing: 0))
        }
    }
    
    func baitText(for number: Int) -> String {
        switch number {
        case 0:
            return "Расскажи об интересах 👨‍💻☕️"
        case 1:
            return "Хорошее начало 👌"
        case 2:
            return "Расскажи еще 🤗"
        case 3:
            return "Звучит отлично! 🙌"
        default:
            return "Nearly there 🤗"
        }
    }
}

struct BaitScoreView_Previews: PreviewProvider {
    static var previews: some View {
        BaitScoreView(rating: 0)
    }
}

