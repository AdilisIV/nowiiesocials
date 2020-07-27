//
//  RegistrationState.swift
//  nowiiesocials
//
//  Created by user on 24.07.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import Foundation
import Combine

typealias RegistrationStore = Store<RegistrationState, RegistrationAction, World>

// For more information check "How To Control The World" - Stephen Celis
// https://vimeo.com/291588126
struct World {
//    var service = GithubService()
}

struct RegistrationState {
    var model: User?
}

enum RegistrationAction {
    case setName(fullname: String)
    case setEmail(email: String)
    case setDateStatus(status: String)
    case setAbout(info: String)
}

//(inout State, Action, Environment) -> AnyPublisher<Action, Never>?

func registrationReducer(state: inout RegistrationState, action: RegistrationAction, enviroment: World) -> AnyPublisher<RegistrationAction, Never> {
    switch action {
    case .setName(let fullname):
        let names = fullname.split(separator: " ")
        state.model?.firstname = String(names[0])
        state.model?.lastname = String(names[1])
    case .setEmail(let email):
        state.model?.email = email
    case .setDateStatus(let status):
        state.model?.dating_status = status
    case .setAbout(let info):
        state.model?.about = info
    }
    return Empty().eraseToAnyPublisher()
}
