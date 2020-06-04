//
//  DigitsPageControl.swift
//  nowiiesocials
//
//  Created by user on 28.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI
import UIKit

struct DigitsPageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> CustomDigitsPageControl {
        let control = CustomDigitsPageControl()
        control.numberOfPages = self.numberOfPages
        control.pageIndicatorTintColor = UIColor.gray
        control.currentPageIndicatorTintColor = UIColor(rgb: 0xFF5C4C)
        control.pageIndicatorTintColor = .white
        
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: CustomDigitsPageControl, context: Context) {
        uiView.currentPage = self.currentPage
    }
    
    
    class Coordinator: NSObject {
        var control: DigitsPageControl
        
        init(_ control: DigitsPageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: CustomDigitsPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

//struct DigitsPageControl_Previews: PreviewProvider {
//    static var previews: some View {
//        var currentPage = 0
//        DigitsPageControl(numberOfPages: 5, currentPage: currentPage)
//    }
//}
