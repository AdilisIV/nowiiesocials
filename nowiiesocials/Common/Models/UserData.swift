//
//  UserData.swift
//  nowiiesocials
//
//  Created by user on 10.11.2019.
//  Copyright © 2019 Ski, LLC. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
