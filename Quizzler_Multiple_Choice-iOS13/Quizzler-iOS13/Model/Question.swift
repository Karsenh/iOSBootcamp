//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Karsen Hansen on 7/19/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let userAnswer: [String]
    let actualAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        userAnswer = a
        actualAnswer = correctAnswer
    }
}
