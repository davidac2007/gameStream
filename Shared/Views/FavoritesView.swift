//
//  FavoritesView.swift
//  GameStream
//
//  Created by David Avendaño on 25/08/21.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var allGames = ViewModel()

    var body: some View {
        
        ZStack{
            Color("NavyBlue").ignoresSafeArea()
            VStack{
                Text("Favorites")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.bottom, 9.0)
                
                ScrollView{
                    ForEach(allGames.gamesInfo, id: \.self){
                        game in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 300)
                            Text("\(game.title)")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                        
                       
                        
                    }
                    Spacer()
                }.padding(.bottom, 8)
            }.padding(.horizontal, 6.0)
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
