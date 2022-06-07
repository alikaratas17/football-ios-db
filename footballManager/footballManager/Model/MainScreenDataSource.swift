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
        mainScreenArray.append("Players Scored Highest In a Given Competition")
        mainScreenArray.append("Top 10 Matches")
        mainScreenArray.append("Top 10 Matches")
        mainScreenArray.append("Top 10 Matches")
        mainScreenArray.append("Match Where a Single Player Has Highest Goals")
    }
    
    func getNumberOfRows() -> Int {
        return mainScreenArray.count
    }
    
    func getRowWithIndex(index: Int) -> String {
        return mainScreenArray[index]
    }
}
