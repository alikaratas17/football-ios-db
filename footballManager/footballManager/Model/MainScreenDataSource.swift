//
//  MainScreenDataSource.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

import Foundation

struct MainScreenDataSource {
    private var mainScreenArray: [String] = []

    init() {
        mainScreenArray.append("Top 10 Players")
        mainScreenArray.append("Top 10 Matches")
    }
    
    func getNumberOfRows() -> Int {
        return mainScreenArray.count
    }
    
    func getRowWithIndex(index: Int) -> String {
        return mainScreenArray[index]
    }
}
