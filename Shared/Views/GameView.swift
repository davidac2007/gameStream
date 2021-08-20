//
//  GameView.swift
//  GameStream
//
//  Created by David Avendaño on 20/08/21.
//

import SwiftUI
import AVKit

struct GameView: View {
    
     var url:String
     var title:String
     var studio:String
     var contentRating:String
     var publicationYear: String
     var description: String
     var tags:[String]
     var imagesUrl:[String]
    
    
    var body: some View {
        
        
        ZStack {
            
            Color("NavyBlue").ignoresSafeArea()
            
            VStack {
                Video(url: url).frame(height: 300)
                ScrollView {
                    // Video info
                    VideoInfo(title: title,
                              studio: studio,
                              contentRating: contentRating,
                              publicationYear: publicationYear,
                              description: description,
                              tags: tags).padding(.bottom)
                              
                              
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct Video: View{
    
    var url: String
    
    var body: some View{
        
        
        
        VideoPlayer(player: AVPlayer(
                        url: URL(string: url)!))
            .ignoresSafeArea()
        
        
    }
}

struct VideoInfo: View{
    
    var title:String
    var studio:String
    var contentRating:String
    var publicationYear: String
    var description: String
    var tags:[String]
//    var imagesUrl:[String]
 
    var body: some View{
        
        VStack(alignment: .leading) {
           
            Text(title)
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                
                Text(studio)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5.0)
                    .padding(.leading)
                
                Text(contentRating)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5.0)
                
                Text(publicationYear)
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5.0)
                   
            }
            
            Text(description)
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5.0)
                .padding(.leading)
            
            HStack{
                
                ForEach(tags, id:\.self){
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4.0)
                        .padding(.leading)
                }
        
            }
            
        }.frame( maxWidth: .infinity, alignment: .leading)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(
            url: "Ejemplo.com",
            title: "Sonic",
            studio: "Sega",
            contentRating: "E+",
            publicationYear: "1991",
            description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            tags: ["plataformas", "mascotas"],
            imagesUrl: ["https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
