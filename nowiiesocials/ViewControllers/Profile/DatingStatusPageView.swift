//
//  DatingStatusPageView.swift
//  nowiiesocials
//
//  Created by user on 02.06.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

let status_notes = ["Хочу познакомиться с коллегами из смежных сфер, такими же крутыми, как я", "Не ищу отношения целеноправленно, но хотела бы из приобрести расширяя круг общения"]

struct DatingStatusPageView<Page: View>: View {
    
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        VStack {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            Spacer()
                .frame(height: 54)
            DigitsPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
        }
    }
}

struct DatingStatusPageView_Previews: PreviewProvider {
    static var previews: some View {
        DatingStatusPageView(status_notes.map({ DatingStatusNote(note: $0) }))
    }
}
