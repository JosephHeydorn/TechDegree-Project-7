//
//  IDStringConversion.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/12/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

var arrayOfURLSOne = [String]()
var arrayOfURLSTwo = [String]()

//Watcher One ID
var watcherOneIDOne = Int(), watcherOneIDTwo = Int(), watcherOneIDThree = Int(), watcherOneIDFour = Int(), watcherOneIDFive = Int()

//Watcher Two ID
var watcherTwoIDOne = Int(), watcherTwoIDTwo = Int(), watcherTwoIDThree = Int(), watcherTwoIDFour = Int(), watcherTwoIDFive = Int()

func stringConversionOne() {
    for IDInts in appendArrayOne {
        let IDStrings = String(IDInts)
        arrayOfURLSOne.append("https://api.themoviedb.org/3/discover/movie?api_key=0045d9aae6eff2fb645130137e72e2ad&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_people=\(IDStrings)")
    }
}

func stringConversionTwo() {
    for IDInts in appendArrayTwo {
        let IDStrings = String(IDInts)
        arrayOfURLSTwo.append("https://api.themoviedb.org/3/discover/movie?api_key=0045d9aae6eff2fb645130137e72e2ad&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_people=\(IDStrings)")
        
    }
}


