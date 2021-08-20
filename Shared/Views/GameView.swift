//
//  GameView.swift
//  GameStream
//
//  Created by David Avendaño on 20/08/21.
//

import SwiftUI

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
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).foregroundColor(.white)
            }
        }
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
