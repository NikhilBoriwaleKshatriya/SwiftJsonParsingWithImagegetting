//
//  swiftmodel.swift
//  SwiftJsonParsingWithImagegetting
//
//  Created by nikhil boriwale on 5/8/18.
//  Copyright © 2018 infostretch. All rights reserved.
//

import Foundation
import SwiftyJSON

struct jsonmodel {
    var artistName: String = ""
    var trackcensoredName : String = ""
    var artworkurl100: String = ""
    var collectionName: String = ""
    var artistId: String = ""
    var collectionCensoredName :String = ""
    var releaseDate :String = ""
     var collectionPrice :String = ""
     var collectionExplicitness :String = ""
     var currency :String = ""
     var country :String = ""
    

    
    init() {
        
    }
    init(json:JSON) {
        artistName = json["artistName"].stringValue     // "" added "key " from url
        trackcensoredName = json["trackCensoredName"].stringValue
        artworkurl100 = json["artworkUrl100"].stringValue
        collectionName = json["collectionName"].stringValue
        artistId = json["artistId"].stringValue
        collectionCensoredName = json["collectionCensoredName"].stringValue
        releaseDate = json["releaseDate"].stringValue
        collectionPrice = json["collectionPrice"].stringValue
        collectionExplicitness = json["collectionExplicitness"].stringValue
        currency = json["currency"].stringValue
        country = json["country"].stringValue
        
    }
}
