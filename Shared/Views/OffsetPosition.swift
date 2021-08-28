//
//  OffsetPosition.swift
//  GameStream
//
//  Created by David Avendaño on 28/08/21.
//

import SwiftUI

struct OffsetPosition: View {
    var body: some View {
        
        
        
        VStack{
            Offsets()
            Positions()
            
            
        }
    }
}

struct Offsets: View {
    var body: some View{
        
        Image("platzi").resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            // Offset modifier does not affect other views position
            .offset(x: 18, y: 20)
        
        Text("Hello world").foregroundColor(.blue).bold()
        
    }
    
}

struct Positions: View {
    var body: some View{
        
        VStack {
            Image("platzi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100
                       ,height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                Position modifier does affect other views position
                .position(x: 100.0, y: 32.0)
        }
        
    }
    
}
struct OffsetPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetPosition()
    }
}
