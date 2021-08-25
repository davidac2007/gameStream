//
//  ProfileView.swift
//  GameStream
//
//  Created by David Avendaño on 25/08/21.
//

import SwiftUI

struct ProfileView: View {
    @State var username = "Lorem"
    
    var body: some View {
        ZStack{
            Color("NavyBlue")
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                
                Text("Profile")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0,
                           idealWidth: 100,
                           maxWidth: .infinity,
                           alignment: .center)
                  
                VStack{
                    
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118,
                               height: 118
                        )
                        .clipShape(Circle())
                        
                    
                }.padding(EdgeInsets(top: 16,
                                     leading: 0,
                                     bottom: 32,
                                     trailing: 0))
                
                Text("Settings")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0,
                           idealWidth: 100,
                           maxWidth: .infinity,
                           alignment: .leading)
                    .padding(.leading,18)
                
                SettingsModule()
            }
            
            
            
        }.onAppear(
            perform: {
                print("Looking for user data")
            }
        )
    }
}

struct SettingsModule: View{
    var body: some View{
        Text("hEYY")
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
