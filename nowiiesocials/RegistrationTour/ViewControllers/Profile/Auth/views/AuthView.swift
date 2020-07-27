//
//  AuthView.swift
//  nowiiesocials
//
//  Created by user on 09.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel: AuthViewViewModel
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    Button<Text>("Ввести инвайт-код") { self.viewModel.sendAuthRequest() }
                        .foregroundColor(Color.hex("FF5C4C"))
                        .offset(x: -16, y: 0)
                }
                Spacer()
                    .frame(height: 52)
                PageView(notes.map { AuthFeatureCard(note: $0) } )
                .aspectRatio(3 / 3.3, contentMode: .fit)
            }
            Spacer()
            VStack {
                Button(action: {
                    print("Hello World tapped!")
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
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(viewModel: AuthViewViewModel())
    }
}
