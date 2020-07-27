//
//  TextView.swift
//  nowiiesocials
//
//  Created by user on 11.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {

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

    class Coordinator: NSObject, UITextViewDelegate {

        var parent: TextView

        init(_ uiTextView: TextView) {
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

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: .constant(""), placeholder: "Какой-то текст...")
    }
}
