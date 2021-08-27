//
//  PtSystem.swift
//  GameStream
//
//  Created by David Avendaño on 27/08/21.
//

import SwiftUI

struct PtSystem: View {
    var body: some View {
        Rectangle().frame(width: 100
                          , height: 100
                          , alignment: .center)
            .foregroundColor(.blue)
    }
}

struct PtSystem_Previews: PreviewProvider {
    static var previews: some View {
        PtSystem()
        
//        PtSystem()
//            .previewDevice("iPhone 11")
//        
//        PtSystem()
//            .previewDevice("iPad Pro (9.7-inch)")
    }
}
