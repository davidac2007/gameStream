//
//  GameView.swift
//  GameStream
//
//  Created by David Avendaño on 21/08/21.
//

import SwiftUI
import Kingfisher
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
            Color("NavyBlue")
                .ignoresSafeArea()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                 
            ZStack {
                
                Color("NavyBlue")
                    .ignoresSafeArea()
                
                VStack {
                    Video(url: url)
                        .frame(height: 300)
                    ScrollView {
                        // Video info
                        VideoInfo(title: title,
                                  studio: studio,
                                  contentRating: contentRating,
                                  publicationYear: publicationYear,
                                  description: description,
                                  tags: tags).padding(.bottom)
                        Gallery(imagesUrl: imagesUrl)
                        Comments().padding(EdgeInsets(
                                            top: 0,
                                            leading: 10,
                                            bottom: 0,
                                            trailing: 10))
                        SimilarGames()
                    }.frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct Comments: View{
    
    var body: some View{
        
        VStack (alignment: .leading){
            Text("Comments")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            ZStack(alignment: .leading){
                Color("Blue-Gray")
                
                VStack(alignment: .leading){
                HStack(spacing: 20){
                    Image("profile2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(.leading)
                    
                   
                        VStack(alignment: .leading){
                            Text("George Sterling")
                                .foregroundColor(.white).fontWeight(.bold)
                            Text("7 days ago")
                                .foregroundColor(.white).font(.caption)
                        }
                       
                  
                }.padding()
                    Text("I have seen that on average it has a great rating, and I completely agree. It is the best game I have played without any doubt, it combines a good plot with a great free play experience thanks to its immense map and activities.")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(EdgeInsets(
                                    top: 0,
                                    leading: 20,
                                    bottom: 10,
                                    trailing: 20))
                }
                
            }.clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.bottom)
            
            ZStack(alignment: .leading){
                Color("Blue-Gray")
                
                VStack(alignment: .leading){
                HStack(spacing: 20){
                    Image("profile3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .padding(.leading)
                    
                   
                        VStack(alignment: .leading){
                            Text("Taylor Kane")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            Text("12 days ago")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                       
                  
                }.padding()
                    Text("Absolutely breath taking game. The graphics are amazing - photo realistic. I am not usually a flight sim fan, but this game is just so completely engrossing that I find myself losing hour after hour in it - and I have only had the game for al little over a day. .")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.body)
                        .padding(EdgeInsets(
                                        top: 0,
                                        leading: 20,
                                        bottom: 10,
                                        trailing: 20))
                }
                
            }.clipShape(RoundedRectangle(cornerRadius: 8))
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SimilarGames: View{
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4",
                              "https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4",
                              "https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4",
                              "https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4",
                              "https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4",
                              "https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4",
                              "https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    var body: some View{
        
        VStack(alignment: .leading){
        Text("Similar Games")
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    
                    Button(action: {url = urlVideos[4]
                          
//                            isPlayerActive = true
                        
                    }, label: {
                                Image("Cuphead")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {url = urlVideos[5]
                          
//                            isPlayerActive = true
                        
                    }, label: {
                                Image("Hades")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 135)
                    })
                    
                    Button(action: {url = urlVideos[6]
                       
//                            isPlayerActive = true
                        
                    }, label: {
                                Image("Grand Theft Auto V")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 240, height: 135)
                    })
                 
                }
                
            }.padding(.bottom)
            
        }
    }
}

struct Video: View{
    
    var url: String
    
    var body: some View{
        VideoPlayer(
            player: AVPlayer(
                url: URL(string: url)!
            ))
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

struct Gallery:View{
    
    var imagesUrl: [String]
    let gridShape = [
        GridItem(.flexible())
    ]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("Gallery")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows:gridShape, spacing: 8.0){
                    
                    ForEach(imagesUrl, id:\.self){
                        
                        imageUrl in
                        
                        // Show images from server using an url
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                        
                    }
                    
                }
                
            }.frame(height: 180)
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
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
            imagesUrl: ["https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
                        ,"https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}

