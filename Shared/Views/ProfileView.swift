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
                        
                    Text(username)
                        .bold()
                        .foregroundColor(.white)
                    
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
    
    @State var isToggleOn = true
    @State var isEditProfile = false
    
    var body: some View{
        
        VStack (spacing: 3.0){
           
            
            GenericButton(title: "Account", onPressed: {})
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Text("Notifications").foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding()
                
            }).background(Color("Blue-Gray"))
            .clipShape(RoundedRectangle(cornerRadius: 1))
            
            GenericButton(title: "Edit Profile", onPressed: {isEditProfile =  true})
            
            GenericButton(title: "Rate this app", onPressed: {})
            
            Spacer()
            
            NavigationLink(
                destination: EditProfile(),
                isActive: $isEditProfile,
                label: {
                    EmptyView()
                })
            
        }
        
        
    }
    
}

struct GenericButton: View{
    
    let title: String
    let onPressed: () -> ()
    
    var body: some View{
        Button(action: onPressed,
               label: {
            HStack {
                Text(title).foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }.padding()
            
        }).background(Color("Blue-Gray"))
        .clipShape(RoundedRectangle(cornerRadius: 1))
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
