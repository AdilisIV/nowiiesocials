//
//  LandmarkList.swift
//  nowiiesocials
//
//  Created by user on 06.11.2019.
//  Copyright © 2019 Ski, LLC. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
