//
//  JSONDataError.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/9/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

enum DataError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
