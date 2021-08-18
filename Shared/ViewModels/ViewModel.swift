//
//  ViewModel.swift
//  GameStream
//
//  Created by David Avendaño on 17/08/21.
//

import Foundation

class ViewModel: ObservableObject {
    
//    Publishing info to listeners
    @Published var gamesInfo = [Game]()
 
    init() {

        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        
//        Specify request type
        request.httpMethod = "GET"
        
//      Create session
        URLSession.shared.dataTask(with: request) { data, response, error in
            do{
                if let jsonData = data{
                    
                    print("Size of json \(jsonData)")
                    
//                    Decode data
                    let decodeData = try
                        JSONDecoder().decode([Game].self, from: jsonData)
                    
//                    Call async func
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                    
                }
                
            }catch{
                
                print("Error: \(error)")
                
            }
        }.resume()
    }
}
