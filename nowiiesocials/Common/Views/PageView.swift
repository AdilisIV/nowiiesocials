//
//  PageView.swift
//  nowiiesocials
//
//  Created by user on 10.05.2020.
//  Copyright © 2020 Ski, LLC. All rights reserved.
//

import SwiftUI

let notes = [("walktrough_artwork_1", "Новые встречи за завтраком они в открытости новым людям и идеям без ожиданий, обид и бесконечных переписок"), ("walktrough_artwork_2", "За делом. За дружбой. За романтикой. Найти собеседника на душевный завтрак или поздний бранч вечером."), ("walktrough_artwork_3", "У нас не ищут отношений, но хотели бы их найти в процессе общения. А еще коллег для совместных проектов или просто друзей со схожими интересами из комьюнити.")]


struct PageView<Page: View>: View {
    
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
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(notes.map { AuthFeatureCard(note: $0) } )
            .aspectRatio(3 / 3.3, contentMode: .fit)
    }
}
