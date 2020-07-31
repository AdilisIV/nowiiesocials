//
//  AuthView.swift
//  nowiiesocials
//
//  Created by user on 09.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject private var store: RegistrationStore
    @ObservedObject var viewModel: AuthViewViewModel
    @State private var selection: String? = nil
    
    var body: some View {
            VStack {
                NavigationLink(destination: AddNameInfoView().environmentObject(store), tag: "navigate_AddName", selection: $selection) { EmptyView() }
                VStack {
                    Spacer()
                        .frame(height: 52)
                    PageView(notes.map { AuthFeatureCard(note: $0) } )
                    .aspectRatio(3 / 3.3, contentMode: .fit)
                }
                Spacer()
                VStack {
                    Button(action: {
                        self.viewModel.signInWithApple { tokenID in
                            print(tokenID)
                            self.selection = "navigate_AddName"
                            self.store.send(.createUser(id: tokenID))
                        }
                    }) {
                        HStack {
                            Image("SignInWithApple_logo")
                            Text("Sign in with Apple")
                                .font(.system(size: 19))
                        }
                        .padding(EdgeInsets(top: 11, leading: 21, bottom: 11, trailing: 21))
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    }
                    Spacer()
                        .frame(height: 25)
                    HStack {
                        Text("Privacy policy")
                            .font(.system(size: 11))
                            .fontWeight(.light)
                            .underline()
                            .gesture(TapGesture().onEnded { _ in
                                print("OPEN PRIVACY")
                            })
                        Text("•")
                        Text("Terms and condition")
                            .font(.system(size: 11))
                            .fontWeight(.light)
                            .underline()
                    }
                    Spacer()
                        .frame(height: 13)
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.selection = "navigate_AddName"
                }) {
                    Text("Ввести инвайт-код")
                }
            )
            .customNavigationBar()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: AuthViewViewModel())
            .environmentObject(RegistrationStore(initialState: .init(), reducer: registrationReducer, environment: World()))
    }
}
