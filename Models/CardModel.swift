//
//  CardModel.swift
//  Assignment3
//
//  Created by user231162 on 3/22/23.
//

import Foundation

struct CardResults : Codable {
    let success : Bool
    let deck_id : String
    let cards : [CardModel]
}
        
struct CardModel : Codable, Hashable {
    let code : String
    let image : String
    let value : String
    let suit : String
}
