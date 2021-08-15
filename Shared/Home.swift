//
//  Home.swift
//  GameStream
//
//  Created by David Avendaño on 15/08/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        TabView{
            Text("Profile Screen").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "person")
                    Text("Profile")
                }
            Text("Games Screen").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "gamecontroller")
                    Text("Games")
                }
            
            Text("Home Screen").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("Favorites Screen").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    Image(systemName: "heart")
                    Text("Favorites")
                }
        }
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
