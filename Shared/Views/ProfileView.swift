//
//  ProfileView.swift
//  GameStream
//
//  Created by David Avendaño on 25/08/21.
//

import SwiftUI

struct ProfileView: View {
    @State var username = "Lorem"
    @State var profileImage:UIImage = UIImage(named: "profile")!
    
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
                    
                    Image(uiImage: profileImage)
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
                
                if returnUserImage(named: "profilePicture") != nil {
                    
                    profileImage = returnUserImage(named: "profilePicture")!
                    
                } else{
                    
                    print("Couldn't find any saved profile image on the device")
                }
                
                if UserDefaults.standard.object(forKey: "userData") != nil {
                    
                    username = UserDefaults.standard.stringArray(forKey: "userData")![2]
                    print("I did find this user: \(username)")
                }else{
                    
                    print("Couldn't find user")
                    
                }
                
            }
        )
    }
    
    func returnUserImage(named:String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
            
        }
        
        return nil
        
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
