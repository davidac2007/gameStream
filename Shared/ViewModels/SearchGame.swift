//
//  SearchGame.swift
//  GameStream
//
//  Created by David Avendaño on 24/08/21.
//

import Foundation

class SearchGame: ObservableObject{
    
    @Published var gameInfo = [Game]()
    
    
    
    func searchGame(gameName: String){
        
        gameInfo.removeAll()
        
//        Adding spaces inside the url of the API calling
        let gameNameSpaces
            = gameName
            .addingPercentEncoding(withAllowedCharacters:
                                    .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
               
        
                var request = URLRequest(url: url)
        
        //        Specify request type
                request.httpMethod = "GET"
        //
        //      Create session
        
                URLSession.shared.dataTask(with: request) { data, response, error in
                    do{
                        if let jsonData = data{
        
                            print("Size of json \(jsonData)")
        
        //                    Decode data
                            let decodeData = try
                                JSONDecoder().decode(Results.self, from: jsonData)
        
        //                    Call async func
                            DispatchQueue.main.async {
                                self.gameInfo.append(contentsOf: decodeData.results)
                            }
        
                        }
        
                    }catch{
        
                        print("Error: \(error)")
        
                    }
                }.resume()
    }
    

}
