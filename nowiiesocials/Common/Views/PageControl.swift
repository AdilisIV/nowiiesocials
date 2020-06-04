//
//  PageControl.swift
//  nowiiesocials
//
//  Created by user on 11.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = self.numberOfPages
        control.pageIndicatorTintColor = UIColor.gray
        control.currentPageIndicatorTintColor = .black
        
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = self.currentPage
    }
    
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}

//struct PageControl_Previews: PreviewProvider {
//    static var previews: some View {
//        var currentPage = 0
//        PageControl(numberOfPages: 5, currentPage: currentPage)
//    }
//}
