//
//  PlayerDataSource.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

import Foundation

struct PlayerDataSource {
    private var playerArray: [Player] = []

    init() {
        playerArray.append(Player(name: "Ali"))
        playerArray.append(Player(name: "Burcu"))
    }
    
    func getNumberOfRows() -> Int {
        return playerArray.count
    }
    
    func getRowWithIndex(index: Int) -> Player {
        return playerArray[index]
    }
}
