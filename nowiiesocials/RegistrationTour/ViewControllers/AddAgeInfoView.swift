//
//  AddAgeInfoView.swift
//  nowiiesocials
//
//  Created by user on 29.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct AddAgeInfoView: View {
    @EnvironmentObject private var store: RegistrationStore
    @State private var isShowingNextView = false
    @State var userAge: String = ""
    
    var body: some View {
        VStack {
            NavigationLink(destination: AddEmailInfoView().environmentObject(store), isActive: $isShowingNextView) { EmptyView() }
            HStack() {
                Text("Немного о вас")
                    .font(Font.custom("NowieVremena-Light", size: 34))
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .lineSpacing(7)
                Spacer()
            }
            HStack() {
                Text("Сколько вам лет?")
                    .font(Font.custom("NowieVremena-Light", size: 20))
                    .padding(EdgeInsets(top: 25, leading: 16, bottom: 0, trailing: 16))
                Spacer()
            }
            TextField("Возраст", text: $userAge)
                .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 0))
                .font(Font.custom("NowieVremena-Light", size: 28))
                .keyboardType(.numberPad)
            Spacer()
        }
        .navigationBarTitle(Text(" "), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                UIApplication.shared.endEditing()
                self.isShowingNextView = true
                self.store.send(.setAge(age: self.userAge))
            }) {
                Text("Done")
            }
            .disabled(!(userAge.count > 0))
            .animation(.default)
        )
    }
}

struct AddAgeInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddAgeInfoView()
        }
    }
}
