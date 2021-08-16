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
    var body: some View{
        
        ZStack {
            
            Color("NavyBlue").ignoresSafeArea()
            
            VStack {
                Text("Hello").foregroundColor(.white)
            }.padding(.horizontal, 18)
            
            
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
