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
        
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
