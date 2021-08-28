//
//  GameStreamApp.swift
//  Shared
//
//  Created by David Avendaño on 10/08/21.
//

import SwiftUI

// The main method
@main
struct GameStreamApp: App {
    
    @Environment(\.scenePhase)  var scenePhase
    
    var body: some Scene {
        WindowGroup {
            HStack {
                ContentView()
//                ContentView()
            }
            
        }.onChange(of: scenePhase) { phase in
                   
                   print(phase)
                   
            switch phase {
            case .active:
                print("App is active")
                
            case .inactive:
                print("App is inactive")
                
            case .background:
                print("App is in background")
               
            default:
                print("Other state")
            }
                   }
        
        
    }
}
