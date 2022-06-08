//
//  Model.swift
//  RandomizerApp
//
//  Created by Artyom Guzenko on 06.06.2022.
//

struct RandomNumber {
    var minimumNumber: Int
    var maximumNumber: Int
    
    var getRandom: Int {
        Int.random(in: minimumNumber...maximumNumber)
    }
}
