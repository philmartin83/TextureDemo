//
//  RequestHandler.swift
//  TextureDemo
//
//  Created by Philip Martin on 23/10/2019.
//  Copyright © 2019 Philip Martin. All rights reserved.
//

import Foundation

class RequestHandler{
    let baseURL = "https://www.breakingbadapi.com/api/"
    
    func getAllCharacters() -> String{
        let url = baseURL + "characters"
        return url
    }
}
