//
//  JSONDecoder.swift
//  Unit7 Project Folder
//
//  Created by Joseph Heydorn on 12/11/19.
//  Copyright © 2019 Joseph Heydorn. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var movieDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
