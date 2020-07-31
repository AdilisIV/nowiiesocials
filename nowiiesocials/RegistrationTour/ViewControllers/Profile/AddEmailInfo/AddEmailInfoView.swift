//
//  AddEmailInfoView.swift
//  nowiiesocials
//
//  Created by user on 17.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//-

import SwiftUI

struct AddEmailInfoView: View {
    
    @EnvironmentObject private var store: RegistrationStore
    @State private var isShowingNextView = false
    @State var userEmail: String = ""
    
    var body: some View {
        VStack {
            NavigationLink(destination: DatingStatusView().environmentObject(store), isActive: $isShowingNextView) { EmptyView() }
            HStack() {
                Text("Немного о вас")
                    .font(Font.custom("NowieVremena-Light", size: 34))
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .lineSpacing(7)
                Spacer()
            }
            HStack() {
                Text("На какой email прислать инвайт-код?")
                    .font(Font.custom("NowieVremena-Light", size: 20))
                    .padding(EdgeInsets(top: 25, leading: 16, bottom: 0, trailing: 16))
                Spacer()
            }
            TextField("email", text: $userEmail)
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
                .font(Font.custom("NowieVremena-Light", size: 28))
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
            Spacer()
        }
        .navigationBarTitle(Text(" "), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                UIApplication.shared.endEditing()
                self.isShowingNextView = true
                self.store.send(.setEmail(email: self.userEmail))
            }) {
                Text("Done")
            }
            .disabled(!EmailValidation.isValid(userEmail))
            .animation(.default)
        )
    }
    
}

struct AddEmailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddEmailInfoView()
        }
    }
}
