//
//  AddEmailInfoView.swift
//  nowiiesocials
//
//  Created by user on 17.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//-

import SwiftUI

struct AddEmailInfoView: View {
    
    @State var username: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack() {
                    Text("На какой email прислать инвайт-код?")
                        .font(Font.custom("NowieVremena-Light", size: 20))
                        .padding(EdgeInsets(top: 25, leading: 16, bottom: 0, trailing: 16))
                    Spacer()
                }
                TextField("email", text: $username)
                    .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
                    .font(Font.custom("NowieVremena-Light", size: 28))
                Spacer()
            }
            .navigationBarTitle(Text("Немного о вас"), displayMode: .large)
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

struct AddEmailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailInfoView()
    }
}
