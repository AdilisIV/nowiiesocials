//
//  AddNameInfoView.swift
//  nowiiesocials
//
//  Created by user on 17.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//-

import SwiftUI

struct AddNameInfoView: View {
    
    @EnvironmentObject private var store: RegistrationStore
    @State private var username: String = ""
    @State private var isShowingNextView = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: RegBioView(), isActive: $isShowingNextView) { EmptyView() }
            HStack() {
                Text("Немного о вас")
                    .font(Font.custom("NowieVremena-Light", size: 34))
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .lineSpacing(7)
                Spacer()
            }
            HStack() {
                Text("Как вас зовут?")
                    .font(Font.custom("NowieVremena-Light", size: 20))
                    .padding(EdgeInsets(top: 25, leading: 16, bottom: 0, trailing: 16))
                Spacer()
            }
            TextField("Имя", text: $username)
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
                .font(Font.custom("NowieVremena-Light", size: 28))
            Spacer()
        }
        .navigationBarTitle(Text(" "), displayMode: .inline)
        .navigationBarItems(trailing:
            Group {
                if username.count > 1 {
                    Button(action: {
                        UIApplication.shared.endEditing()
                        self.isShowingNextView = true
                    }) {
                        Text("Done")
                    }
                }
            }
        )
    }
    
    func validateTextField(string: String) -> Bool {
        return true
    }
}

struct AddNameInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNameInfoView()
    }
}
