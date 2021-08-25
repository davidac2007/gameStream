//
//  SaveData.swift
//  GameStream
//
//  Created by David Avendaño on 25/08/21.
//

import Foundation

class SaveData{
    
    var email: String = ""
    var password: String = ""
    var username: String = ""
    
    func saveData(email: String, password: String, username: String) -> Bool {
        
        print("Inside this function I got: \(email) + \(password) + \(username)")
        
        UserDefaults.standard.set([email, password, username], forKey: "userData")
        
        return true
    }
    
    func getData() -> [String]{
        
        let userData: [String] = UserDefaults.standard.stringArray(forKey: "userData")!
        print("I'm in get Data method and I got this: \(userData)")
        
         return userData
    }
    
    func validateData(email:String, password: String) -> Bool {
        
        var savedEmail = ""
        var savedPassword = ""
        
        
        print("Validating data in User Defaults with email \(email) and password \(password)")
            
        if UserDefaults.standard.object(forKey: "userData") != nil{
            
            savedEmail = UserDefaults.standard.stringArray(forKey: "userData")![0]
            
            savedPassword = UserDefaults.standard.stringArray(forKey: "userData")![1]
            
            print("I got this email: \(savedEmail) and this password: \(savedPassword)")
            
            if(email == savedEmail && password == savedPassword){
                return true
            } else{
                return false
            }
            
            
           
        } else {
            print("There's no available data")
            return false
        }
        
    }
    
    
}
