//
//  DatingStatusView.swift
//  nowiiesocials
//
//  Created by user on 28.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct DatingStatusView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    Text("Почему вы хотите встретить новых людей")
                        .font(Font.custom("NowieVremena-Light", size: 34))
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .lineSpacing(7)
                    Spacer()
                }
                Spacer()
                    .frame(height: 60)
                DatingStatusPageView(status_notes.map({ DatingStatusNote(note: $0) }))
                    .frame(height: 275)
                Spacer()
                Button(action: {
                    print("fm sdl")
                }) {
                    Text("Мне подходит🔥")
                        .padding(EdgeInsets(top: 15, leading: 38, bottom: 15, trailing: 38))
                        .foregroundColor(.white)
                        .background(Color.hex("FF5C4C"))
                        .font(Font.custom("NowieVremena-Light", size: 20))
                }
                Spacer()
                    .frame(height: 30)
            }

            .navigationBarTitle("", displayMode: .inline)
        }
        .onAppear(perform: customNavigationBar)
    }
    
    
    func customNavigationBar() {
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

struct DatingStatusView_Previews: PreviewProvider {
    static var previews: some View {
        DatingStatusView()
    }
}
