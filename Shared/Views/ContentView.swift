//
//  ContentView.swift
//  Shared
//
//  Created by David Avendaño on 10/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            
            ZStack {
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    .ignoresSafeArea()
                
                VStack{
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 40)
                    SignInSignUpView()
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
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
    @State var isHomeActive = false
    @State var isDataInvalid = false
    
    func validateData() {
        let validateDataObject = SaveData()
        isDataInvalid = validateDataObject.validateSignInData(email: email, password: password)
        if(!isDataInvalid){
            isHomeActive = true
        }
    }
    
    var body: some View{
        ScrollView {
            VStack(alignment: .leading){
                Text("Email")
                    .foregroundColor(Color("Dark-Cian"))
                ZStack(alignment: .leading){
                    if email.isEmpty{
                        Text("example@email.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $email)
                        .foregroundColor(.white)
                }
                Divider()
                    .frame(height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(isDataInvalid ? Color(.red) : Color("Dark-Cian"))
                    .padding(.bottom)
                Text("Password")
                    .foregroundColor(Color(.white))
                ZStack(alignment: .leading){
                    if password.isEmpty{
                        Text("Your password")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $password)
                        .foregroundColor(.white)
                }
                Divider()
                    .frame(height: 1, alignment: .center)
                    .background(isDataInvalid ?  Color(.red) : Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Forgot password?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                SignInUpButton(buttonTitle: "SIGN IN") {
                    validateData()
                    
                }.alert(isPresented: $isDataInvalid){
                    Alert(title: Text("Inconrrect Email or Password"),
                          message: Text("Your email or password is wrong"), dismissButton: .default(Text("OK")))
                }
                
            }
            SocialAuthButtons(captionTitle: "Sign In With")
        }.padding(.horizontal, 50.0)
        NavigationLink(
            destination: Home(),
            isActive: $isHomeActive,
            label: {
                EmptyView()
            })
        
        
        
    }
    
}



func signInWithFacebook(){
    print("Signing in with Facebook")
}

func signInWithTwitter(){
    print("Signing in with Twitter")
}

struct EmailPasswordFields: View{
    @State var email = ""
    @State var password = ""
    var body: some View{
        VStack(alignment: .leading){
            Text("Email")
                .foregroundColor(Color("Dark-Cian"))
            ZStack(alignment: .leading){
                if email.isEmpty{
                    Text("example@email.com")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                TextField("", text: $email)
                    .foregroundColor(.white)
            }
            Divider()
                .frame(height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            Text("Password")
                .foregroundColor(Color(.white))
            ZStack(alignment: .leading){
                if password.isEmpty{
                    Text("Your password")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                SecureField("", text: $password)
                    .foregroundColor(.white)
            }
            Divider()
                .frame(height: 1, alignment: .center)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            
            Text("Forgot password?")
                .font(.footnote)
                .frame(width: 300, alignment: .trailing)
                .foregroundColor(Color("Dark-Cian"))
                .padding(.bottom)
            
        }
    }
    
}

struct SignInUpButton: View{
    let buttonTitle: String
    let onPressed: () -> ()
    var body: some View{
        Button(action: onPressed, label: {
            Text(buttonTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("Dark-Cian"),lineWidth: 1.0)
                            .shadow(color: .white,radius: 6))
        })
    }
}

struct SignUpView: View{
    
    
    var body: some View{
        ScrollView {
            Text("Choose a profile picture")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            Text("You can change it later on")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.gray)
            Button(action: takeProfilePic, label: {
                ZStack {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Image(systemName: "camera").foregroundColor(.white)
                }
            })
            VStack(alignment: .leading){
                TextFields()
                SignInUpButton(buttonTitle: "SIGN UP") {
                    print("Signing up")
                }
                SocialAuthButtons(captionTitle: "Sign up with")
            }
        }.padding(.horizontal, 30.0)
    }
}

struct TextFields: View{
    @State var email = ""
    @State var password = ""
    
    var body: some View{
        Text("Email*")
            .foregroundColor(Color("Dark-Cian"))
        
        ZStack(alignment: .leading){
            
            if email.isEmpty{
                Text("example@email.com")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            TextField("", text: $email)
                .foregroundColor(.white)
        }
        
        Divider()
            .frame(height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color("Dark-Cian")).padding(.bottom)
        
        Text("Password*")
            .foregroundColor(Color(.white))
        ZStack(alignment: .leading){
            
            if password.isEmpty{
                Text("Your password")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            SecureField("", text: $password)
                .foregroundColor(.white)
        }
        
        Divider()
            .frame(height: 1, alignment: .center)
            .background(Color("Dark-Cian"))
            .padding(.bottom)
        
        Text("Confirm Password*")
            .foregroundColor(Color(.white))
        ZStack(alignment: .leading){
            
            if password.isEmpty{
                Text("Confirm your password")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            SecureField("", text: $password)
                .foregroundColor(.white)
        }
        
        Divider()
            .frame(height: 1, alignment: .center)
            .background(Color("Dark-Cian"))
            .padding(.bottom, 30.0)
    }
}

struct SocialAuthButtons: View{
    let captionTitle: String
    var body: some View{
        VStack{
            Text(captionTitle)
                .font(.body)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 10, trailing: 0))
            
            HStack(alignment: .center){
                Spacer()
                Button(action: signInWithFacebook, label: {
                    Text("Facebook")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 10, leading: 18, bottom: 11, trailing: 18))
                        .background(RoundedRectangle(cornerRadius: 10.0)
                                        .fill(Color(red: 41/255, green: 57/255, blue: 87/255, opacity: 1.0)))
                })
                Spacer(minLength: 20)
                Button(action: signInWithTwitter, label: {
                    Text("Twitter")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 10, leading: 18, bottom: 11, trailing: 18))
                        .background(RoundedRectangle(cornerRadius: 10.0)
                                        .fill(Color(red: 41/255, green: 57/255, blue: 87/255, opacity: 1.0)))
                })
                Spacer()
            }}
    }
}

func takeProfilePic() {
    print("Taking picture")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
