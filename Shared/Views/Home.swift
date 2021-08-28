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
            ProfileView()
                .tabItem {
                    
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(0)
            
            GamesView()
                .tabItem {
                    
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }.tag(1)
            
            HomeScreen()
                .tabItem {
                    
                    Image(systemName: "house")
                    Text("Home")
                }.tag(2)
            
           FavoritesView()
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
    @ObservedObject var foundGame = SearchGame()
    @State var isGameViewActive = false
    @State var isGameInfoEmpty = false
    @State var isPlayerActive = false
    @State var url = ""
    @State var title:String = ""
    @State var textSearch = ""
    @State var studio:String = ""
    @State var contentRating:String = ""
    @State var publicationYear:String = ""
    @State var description:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    var device = UIDevice.current.model
    
    var body: some View{
        
        
        VStack {
            
            HStack{
                Button(action: {
                    
                    watchGame(name: textSearch)
                    
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(textSearch.isEmpty ?
                                            Color(.yellow) : Color("Dark-Cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    
                    Alert(title: Text("Error"), message: Text("Couldn't find any game"), dismissButton: .default(Text("OK")))
                }
                
                ZStack(alignment: .leading){
                    if textSearch.isEmpty{
                        Text(device)
                            .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    
                    TextField("", text: $textSearch).foregroundColor(.white)
                }
                
            }.padding([.top, .leading, .bottom], 11.0)
            .background(Color("Blue-Gray")).clipShape(Capsule())
            
            
            Text("Most popular")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,  alignment: .leading)
                .padding(.top)
            ZStack{
                
                Button(action: {
                    watchGame(name: "The Witcher 3")
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
                
                if device == "iPad" {
                    
                    
                    HStack(spacing: 15){
                        
                        Button(action: {
                            watchGame(name: "Abzu")
                        }, label: {
                            Image("Abzu").resizable().scaledToFit().frame(width: 320, height: 180)
                        })
                        
                        Button(action: {
                            watchGame(name: "Crash Bandicoot")
                            
                        }, label: {
                            Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 320, height: 180)
                        })
                        
                        Button(action: {
                            watchGame(name: "DEATH STRANDING")
                        }, label: {
                            Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 320, height: 180)
                        })
                        
                    }
                    
                } else{
                    
                    
                    HStack(spacing: 15){
                        
                        Button(action: {
                            watchGame(name: "Abzu")
                        }, label: {
                            Image("Abzu").resizable().scaledToFit().frame(width: 240, height: 135)
                        })
                        
                        Button(action: {
                            watchGame(name: "Crash Bandicoot")
                            
                        }, label: {
                            Image("Crash Bandicoot").resizable().scaledToFit().frame(width: 240, height: 135)
                        })
                        
                        Button(action: {
                            watchGame(name: "DEATH STRANDING")
                        }, label: {
                            Image("DEATH STRANDING").resizable().scaledToFit().frame(width: 240, height: 135)
                        })
                        
                    }
                    
                }
                    
           
                
            }.padding(.bottom)
            
            Text("You may also like")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity,  alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    
                    Button(action: {
                        watchGame(name: "Cuphead")
                    }, label: {
                        Image("Cuphead").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(name: "Hades")
                        
                    }, label: {
                        Image("Hades").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(name: "Grand Theft Auto V")
                    }, label: {
                        Image("Grand Theft Auto V").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                }
                
            }.padding(.bottom)
            
            
            
        }.padding(.horizontal, 20)
        
        
        NavigationLink(
            destination:
                GameView(url: url,
                         title: title,
                         studio: studio,
                         contentRating: contentRating,
                         publicationYear: publicationYear,
                         description: description,
                         tags: tags,
                         imagesUrl: imgsUrl)
            ,
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })
        
    }
    func watchGame(name: String){
        
        foundGame.searchGame(gameName: name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("E number: \(foundGame.gameInfo.count)")
            
            if foundGame.gameInfo.count == 0 {
                isGameInfoEmpty = true
            } else{
                
                url = foundGame.gameInfo[0].videosUrls.mobile
                title = foundGame.gameInfo[0].title
                studio = foundGame.gameInfo[0].studio
                contentRating = foundGame.gameInfo[0].contentRaiting
                publicationYear = foundGame.gameInfo[0].publicationYear
                description = foundGame.gameInfo[0].description
                tags = foundGame.gameInfo[0].tags
                imgsUrl = foundGame.gameInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
