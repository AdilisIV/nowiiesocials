//
//  UIApplication+actions.swift
//  nowiiesocials
//
//  Created by user on 27.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
