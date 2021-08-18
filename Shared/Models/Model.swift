//
//  Model.swift
//  GameStream
//
//  Created by David Avendaño on 17/08/21.
//

import Foundation

struct Games: Codable{
    
    var games:[Game]
}

struct Game: Codable{
    
    var title:String
    var studio:String
    var contentRating:String
    var publicationYear:String
    var description:String
    var platforms:[String]
    var tags:[String]
    var videosUrls:VideoUrl
    var galleryImages:[String]
    
}

struct VideoUrl:Codable{
    var mobile:String
    var tablet:String
}
