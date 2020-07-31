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
            NavigationLink(destination: AddAgeInfoView().environmentObject(store), isActive: $isShowingNextView) { EmptyView() }
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
                .textContentType(.givenName)
            Spacer()
        }
        .navigationBarTitle(Text(" "), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                UIApplication.shared.endEditing()
                self.isShowingNextView = true
                self.store.send(.setName(fullname: self.username))
            }) {
                Text("Done")
            }
            .disabled(!(username.count > 2))
        )
    }
    
    func validateTextField(string: String) -> Bool {
        return true
    }
}

struct AddNameInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddNameInfoView()
        }
    }
}
