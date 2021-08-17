//
//  Home.swift
//  GameStream
//
//  Created by David Avendaño on 15/08/21.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var selectedTab: Int = 2
    var body: some View {
        
        TabView(selection: $selectedTab){
            Text("Profile Screen").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(0)
            
            Text("Games Screen").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
            
            HomeScreen()
                .tabItem {
                    
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            
            Text("Favorites Screen").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(3)
        }.accentColor(.white)
        
    }
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("TabBarColor"))
        UITabBar.appearance().isTranslucent = true
        print("init views")
    }
}

struct HomeScreen: View{
    
    @State var textSearch = ""
    var body: some View{
        
        
        ZStack {
            
            Color("NavyBlue").ignoresSafeArea()
            
            ScrollView {
                VStack {
                    
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.vertical, 11.0)
                    
                    
                    HStack{
                        Button(action: {
                            search()
                        }, label: {
                            Image(systemName: "magnifyingglass").foregroundColor(textSearch.isEmpty ? Color(.yellow) : Color("Dark-Cian")   )
                        })
                        
                        ZStack(alignment: .leading){
                            if textSearch.isEmpty{
                                Text("Search")
                                    .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            }
                            
                            TextField("", text: $textSearch).foregroundColor(.white)
                        }
                        
                    }.padding([.top, .leading, .bottom], 11.0)
                    .background(Color("Blue-Gray")).clipShape(Capsule())
                    
                }.padding(.horizontal, 18)
                SubModuleHome()
            }
            
            
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func search() {
        print("Searching for the videogame")
    }
}

struct SubModuleHome:View{
    @State var isPlayerActive = false
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    var body: some View{
        
        
        VStack {
            Text("Most popular")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,  alignment: .leading)
                .padding(.top)
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("url: \(url)")
                    isPlayerActive = true
                }, label: {
                    
                    VStack(spacing: 0){
                        
                        Image("The Witcher 3").resizable().aspectRatio(contentMode: .fit)
                        Text("  The Witcher 3: Wild Hunt").bold().frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,minHeight: 50,  alignment: .leading).background(Color("Blue-Gray"))
                    }
                    
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
                
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,  alignment: .center)
            .padding(.vertical)
            
            Text("Explore")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,  alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    
                    Button(action: {}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            Image("FPS").resizable().aspectRatio(contentMode: .fit).frame(width: 42, height: 42)
                        }
                    })
                    Button(action: {}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            Image("RPG").resizable().aspectRatio(contentMode: .fit).frame(width: 42, height: 42)
                        }
                    })
                    Button(action: {}, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("Blue-Gray"))
                                .frame(width: 160, height: 90)
                            Image("OpenWorld").resizable().aspectRatio(contentMode: .fit).frame(width: 42, height: 42)
                        }
                    })
                }
                
            }.padding(.bottom)
            
            Text("Recommended for you")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,  alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    
                    Button(action: {url = urlVideos[1]
                            print("url: \(url)")
                            isPlayerActive = true}, label: {
                                Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {url = urlVideos[2]
                            print("url: \(url)")
                            isPlayerActive = true}, label: {
                                Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {url = urlVideos[3]
                            print("url: \(url)")
                            isPlayerActive = true}, label: {
                                Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                 
                }
                
            }.padding(.bottom)
            
            Text("You may also like")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,  alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    
                    Button(action: {url = urlVideos[4]
                            print("url: \(url)")
                            isPlayerActive = true}, label: {
                                Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {url = urlVideos[5]
                            print("url: \(url)")
                            isPlayerActive = true}, label: {
                                Image("Hades").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {url = urlVideos[6]
                            print("url: \(url)")
                            isPlayerActive = true}, label: {
                                Image("Grand Theft Auto V").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                 
                }
                
            }.padding(.bottom)
            
            
            
        }.padding(.horizontal, 20)
        
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 400, height: 300),
            isActive: $isPlayerActive,
            label: {
                EmptyView()
            })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
