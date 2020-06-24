//
//  TextView.swift
//  nowiiesocials
//
//  Created by user on 11.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

final class TextView: NSObject, UIViewRepresentable, UITextViewDelegate {
    
    var text: Binding<String>
    var placeholder: String
    
    public init(text: Binding<String>, placeholder: String) {
        self.text = text
        self.placeholder = placeholder
    }
    
    public func makeUIView(context: Context) -> UITextView {
        let textView = GrowingTextView()
        textView.placeholder = self.placeholder
        textView.placeholderColor = UIColor(rgb: 0xC9C9C9)
        textView.font = UIFont(name: "NowieVremena-Light", size: 20)!
        textView.delegate = self
        return textView
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text.wrappedValue
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        self.text.wrappedValue = textView.text
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: .constant(""), placeholder: "Чем ты сейчас занимаешь, что нового изучаешь, чем можешь быть полезен…")
    }
}
