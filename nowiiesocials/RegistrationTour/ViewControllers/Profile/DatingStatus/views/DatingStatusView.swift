//
//  DatingStatusView.swift
//  nowiiesocials
//
//  Created by user on 28.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct DatingStatusView: View {
    
    @EnvironmentObject private var store: RegistrationStore
    @State private var isShowingNextView = false
    
    
    var body: some View {
        VStack {
            NavigationLink(destination: RegBioView().environmentObject(store), isActive: $isShowingNextView) { EmptyView() }
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
//                print("SELECTED: \(self.selectedStatus)")
//                self.store.send(.setDateStatus(status: self.selectedStatus))
//                self.isShowingNextView = true
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
        .navigationBarTitle(" ", displayMode: .inline)
        .customNavigationBar()
    }
    
}

struct DatingStatusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DatingStatusView().environmentObject(RegistrationStore(initialState: .init(), reducer: registrationReducer, environment: World()))
        }
    }
}
