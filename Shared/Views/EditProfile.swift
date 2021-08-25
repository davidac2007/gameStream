//
//  EditProfile.swift
//  GameStream
//
//  Created by David Avendaño on 25/08/21.
//

import SwiftUI

struct EditProfile: View {
    var body: some View {
        ZStack{
            Color("NavyBlue").ignoresSafeArea()
            
            ScrollView{
                
                VStack {
                    Text("Edit Profile")
                        .foregroundColor(.white)
                    
                    Button(action: {}, label: {
                        ZStack {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                        }
                    })
                    
                    
                    
                }.padding(.bottom, 18.0)
                
                
                EditModule()
                
            }
            
        }
    }
}


struct EditModule: View{
    var body: some View{
        
        
        Text("Edit profile module")
        
    }
    
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
