//
//  PageViewController.swift
//  nowiiesocials
//
//  Created by user on 10.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    
    
    // calls before <makeUIViewController(context...)>
    // may be used for to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Coordinator является частью контекста в UIViewControllerRepresentable
    // pageViewController.dataSource = context.coordinator
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[currentPage]], direction: .forward, animated: true, completion: nil)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        
        // MARK: - PageViewController DataSource & Delegate
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else { return nil }
            
            if index == 0 {
                return parent.controllers.last
            }
            
            return parent.controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.controllers.firstIndex(of: viewController) else { return nil }
            
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            }
            
            return parent.controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first,
                let index = parent.controllers.firstIndex(of: visibleViewController)
            {
                parent.currentPage = index
            }
        }
    }
}

//struct AuthPageViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthPageViewController()
//    }
//}

//struct PageViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
