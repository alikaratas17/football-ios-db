//
//  Player.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

import Foundation

struct Player : Decodable{
    let name: String
}
struct TestJSONObject : Encodable{
    let foo:String
    let bar : Int
}
