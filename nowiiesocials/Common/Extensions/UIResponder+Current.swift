//
//  UIResponder+Current.swift
//  nowiiesocials
//
//  Created by user on 26.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import UIKit


// From https://stackoverflow.com/a/14135456/6870041

extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    private static weak var _currentFirstResponder: UIResponder?
    
    @objc private func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
    
    
    // The globalFrame property calculates the responder frame in the global coordinate space.
    
    var globalFrame: CGRect? {
        guard let view = self as? UIView else { return nil }
        return view.superview?.convert(view.frame, to: nil)
    }
}
