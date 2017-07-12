//
//  Story.swift
//  Destini
//
//  Created by Richard Huynh on 5/29/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    
    let storyString : String
    let storyPathA  : Int?
    let storyPathB  : Int?
    let buttonTextA : String?
    let buttonTextB : String?
    
    init(story: String){
        storyString = story
        buttonTextA = nil
        buttonTextB = nil
        storyPathA = nil
        storyPathB = nil
        
    }
    
    init(story: String, bTextA: String, bTextB: String, pathA: Int, pathB: Int){
        storyString = story
        buttonTextA = bTextA
        buttonTextB = bTextB
        storyPathA = pathA
        storyPathB = pathB
    }
    
}
