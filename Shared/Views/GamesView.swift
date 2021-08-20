//
//  GamesView.swift
//  GameStream
//
//  Created by David Avendaño on 17/08/21.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var allGames = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var url:String = ""
    @State var title:String = ""
    @State var studio:String = ""
    @State var contentRating:String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags:[String] = [""]
    @State var imagesUrl:[String] = [""]
    
    let gridShape = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        ZStack{
            Color("NavyBlue").ignoresSafeArea()
            
            VStack{
                
                Text("Games")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    
                    LazyVGrid(columns: gridShape, spacing: 8){
                        
                        ForEach(allGames.gamesInfo, id: \.self){
                            game in
                            
                            Button( action: {
                                
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                contentRating = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                                tags = game.tags
                                imagesUrl = game.galleryImages
                                
                                print("Tapped the game: \(title)")
                                
                                gameViewIsActive = true
                            }, label: {
                                KFImage(URL(string: game.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                    .padding(.bottom, 12)
                            })
                    }
                }
                
            }.padding(.horizontal, 6)
                
                NavigationLink(
                    destination: GameView(
                        url: url,
                        title: title,
                        studio: studio,
                        contentRating: contentRating,
                        publicationYear: publicationYear,
                        description: description,
                        tags: tags,
                        imagesUrl: imagesUrl),
                    isActive: $gameViewIsActive,
                    label:
                        {
                            EmptyView()
                        })
            
        }
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
}
