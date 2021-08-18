//
//  GamesView.swift
//  GameStream
//
//  Created by David Avendaño on 17/08/21.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allGames = ViewModel()
    
    var body: some View {
        Text("Hello from Games View")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                print("First json element: \(allGames.gamesInfo[0])")
                print("First videogame json title \(allGames.gamesInfo[0].title)")
            })
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
