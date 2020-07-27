//
//  Publishers+keyboardHeight.swift
//  nowiiesocials
//
//  Created by user on 26.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import UIKit
import Combine

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map{ $0.keyboardHeight }
        
        return MergeMany(willShow, willHide).eraseToAnyPublisher()
    }
}
