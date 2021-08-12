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
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
            VStack{
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                SignInSignUpView()
            }
        }.ignoresSafeArea()
        
    }
}

struct SignInSignUpView: View{
    var body: some View{
        
        VStack{
            HStack {
                Text("SIGN IN")
                Text("SIGN UP")
            }
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("Screen1")
        ContentView()
    }
}
