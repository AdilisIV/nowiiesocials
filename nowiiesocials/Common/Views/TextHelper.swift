//
//  TextHelper.swift
//  My Favourite Recipes
//
//  Created by Chris Barker on 27/12/2019.
//  Copyright © 2019 Packt. All rights reserved.
//

import UIKit
import SwiftUI

struct TextViewRep: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = GrowingTextView()
        textView.placeholder = self.placeholder
        textView.placeholderColor = UIColor(rgb: 0xC9C9C9)
        textView.font = UIFont(name: "NowieVremena-Light", size: 20)!
        textView.delegate = context.coordinator
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: TextViewRep

        init(_ uiTextView: TextViewRep) {
            self.parent = uiTextView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
