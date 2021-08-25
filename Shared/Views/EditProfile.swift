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
                        .fontWeight(.bold)
                        .padding(.bottom)
                    
                    
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
    
    @State var mail = ""
    @State var password = ""
    @State var username = ""
    
    var body: some View{
        
        VStack (alignment: .leading){
            Text("Email")
                .foregroundColor(Color("Dark-Cian"))
            
            ZStack(alignment: .leading){
                
                if mail.isEmpty{
                    
                    Text("example@email.com").font(.caption)
                        .foregroundColor(.gray)
                } else{
                    
                }
                
                TextField("", text: $mail)
                    .foregroundColor(.white)
                        
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
            
            Text("Password")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                
                if password.isEmpty{
                    
                    Text("Enter your password").font(.caption)
                        .foregroundColor(.gray)
                } else{
                    
                }
                
                SecureField("", text: $password)
                    .foregroundColor(.white)
               
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
            
            Text("Name").foregroundColor(.white)
            ZStack(alignment: .leading){
                
                if username.isEmpty{
                    
                    Text("Enter your name").font(.caption)
                        .foregroundColor(.gray)
                } else{}
                
                TextField("", text: $username)
                    .foregroundColor(.white)
       
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom, 32.0)
            
            Button(action: {updateData()}, label: {
                Text("UPDATE PROFILE")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .padding(EdgeInsets(
                                top: 11,
                                leading: 18,
                                bottom: 11,
                                trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(
                                    Color("Dark-Cian"),
                                    lineWidth: 1.0)
                                .shadow(
                                    color: .white,
                                    radius: 3))
            }).padding(.bottom)
        }.padding(.horizontal, 42.0)
    }
    
    func updateData(){
        print("Saving and updating user data")
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
