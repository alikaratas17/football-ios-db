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
        mainScreenArray.append("Referees (Who Were In More Than 100 Matches) With Highest Average Goals Scored In a Match")
        mainScreenArray.append("Retired Player With Highest Total Goal Contribution/ATH Market Value Ratio (Larger Than 10m)")
        mainScreenArray.append("Clubs Having More Than 500 Home Goals and 500 Away Goals")
        mainScreenArray.append("Match Where a Single Player Has Highest Goals")
    }
    
    func getNumberOfRows() -> Int {
        return mainScreenArray.count
    }
    
    func getRowWithIndex(index: Int) -> String {
        return mainScreenArray[index]
    }
}
