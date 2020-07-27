//
//  AuthViewViewModel.swift
//  nowiiesocials
//
//  Created by user on 10.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import Foundation

final class AuthViewViewModel: ObservableObject {
    
    @Published private(set) var isLoading = false
    
    init() {
        
    }
    
    
    func sendAuthRequest() {
        print("sendAuthRequest")
    }
    
}
