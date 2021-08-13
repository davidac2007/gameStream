//
//  ContentView.swift
//  Shared
//
//  Created by David Avendaño on 10/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Spacer()
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
            
            VStack{
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 40)
                SignInSignUpView()
            }
        }
        
    }
}

struct SignInSignUpView: View{
    
    @State var signIn = true
    
    
    var body: some View{
        
        VStack{
            HStack {
                Spacer()
                Button("SIGN IN"){
                    signIn = true
                    print("Sign In View")
                }.foregroundColor(signIn ? .white : .gray)
                Spacer()
                Button("SIGN UP"){
                    signIn = false
                    print("Sign Up View")
                }.foregroundColor(signIn ? .gray : .white)
                Spacer()
                
            }
            
             Spacer(minLength: 42)
            
            if signIn == true{
                SignInView()
            }else{
                SignUpView()
            }
        }
        
    }
    
}


struct SignInView: View{
    
    @State var email = ""
    @State var password = ""
    var body: some View{
        ScrollView {
            
            VStack(alignment: .leading){
                Text("Email").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if email.isEmpty{
                    Text("example@email.com").font(.caption).foregroundColor(.gray)
                    }
                    TextField("", text: $email)
                }
                
                Divider().frame(height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Password").foregroundColor(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    
                    if password.isEmpty{
                    Text("Your password").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $password)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                
            }
        }.padding(.horizontal, 77.0)
       
    }
}

struct SignUpView: View{
    var body: some View{
        Text("You're in sign up view").foregroundColor(.white)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("Screen1")
        ContentView()
    }
}
