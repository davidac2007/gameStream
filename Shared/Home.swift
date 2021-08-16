//
//  Home.swift
//  GameStream
//
//  Created by David Avendaño on 15/08/21.
//

import SwiftUI

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
            
            VStack {
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11.0)
                
                
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
            
            
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func search() {
        print("Searching for the videogame")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
