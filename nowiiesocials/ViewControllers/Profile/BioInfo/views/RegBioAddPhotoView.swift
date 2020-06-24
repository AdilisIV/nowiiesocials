//
//  RegBioAddPhotoView.swift
//  nowiiesocials
//
//  Created by user on 07.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct RegBioAddPhotoView: View {
    @State private var showingSheet = false
    
    @State var showingImagePicker = false
    @State var userImage: Image?
    
    var body: some View {
        HStack {
            (userImage == nil ? Image("user_avatar_1") : userImage)!
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 78)
                .clipShape(Circle())
                .padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 20))
            Button(action: {
                self.showingSheet = true
            }) {
                Text("Добавьте свою фотографию")
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 17))
                    .foregroundColor(Color.hex("FF5C4C"))
                    .font(Font.custom("NowieVremena-Light", size: 20))
            }
            .actionSheet(isPresented: $showingSheet) {
                ActionSheet(title: Text("Изменить фото профиля"), buttons: [
                    .default(Text("Сделать фото"), action: {
                        print("Сделать фото")
                    }),
                    .default(Text("Выбрать из галлереи"), action: {
                        print("Выбрать из галлереи")
                        self.showingImagePicker.toggle()
                    }),
                    .cancel()
                ])
            }
            Spacer()
        }
        .sheet(isPresented: $showingImagePicker, content: {
            ImagePicker.shared.view
        }).onReceive(ImagePicker.shared.$image, perform: { image in
            self.userImage = image
        })
    }
    
}

struct RegBioAddPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        RegBioAddPhotoView()
            .frame(height: 78)
    }
}
