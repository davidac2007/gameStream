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
    var body: some View{
        Text("You're in sign in view").foregroundColor(.white)
       
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
