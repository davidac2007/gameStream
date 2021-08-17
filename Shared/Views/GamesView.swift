//
//  GamesView.swift
//  GameStream
//
//  Created by David Avendaño on 17/08/21.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hello from Games View")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                print("First json element")
                    print("First videogame json title")
            })
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
