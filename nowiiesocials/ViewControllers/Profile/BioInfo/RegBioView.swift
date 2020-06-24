//
//  RegBioView.swift
//  nowiiesocials
//
//  Created by user on 07.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct RegBioView: View {
    
//    var userText: Binding<String>
    @State private var userText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    Text("140 букв о себе. Расскажите")
                        .font(Font.custom("NowieVremena-Light", size: 34))
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .lineSpacing(7)
                    Spacer()
                }
                Spacer()
                    .frame(height: 52)
                RegBioAddPhotoView()
                Spacer()
                    .frame(height: 38)
                TextView(text: $userText, placeholder: "Чем ты сейчас занимаешь, что нового изучаешь, чем можешь быть полезен…")
                    .padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 16))
                
                Spacer()
                RegBioTextFieldBait(charactersAmount: userText.count)
                    .padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17))
                Spacer()
                    .frame(height: 33)
                Button(action: {
                    print("fm sdl")
                }) {
                    Text("Далее")
                        .padding(EdgeInsets(top: 15, leading: 38, bottom: 15, trailing: 38))
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.hex("FF5C4C"))
                        .font(Font.custom("NowieVremena-Light", size: 20))
                        .padding()
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

struct RegBioView_Previews: PreviewProvider {
    static var previews: some View {
        RegBioView()
    }
}
