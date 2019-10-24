//
//  Character.swift
//  TextureDemo
//
//  Created by Philip Martin on 23/10/2019.
//  Copyright © 2019 Philip Martin. All rights reserved.
//

import Foundation
struct Character : Codable {
    let charID : Int?
    let name : String?
    let birthday : String?
    let occupation : [String]?
    let img : String?
    let status : String?
    let nickname : String?
    let appearance : [Int]?
    let portrayed : String?
    let category : String?
    let betterCallSaulAppearance : [Int]?
    
    enum CodingKeys: String, CodingKey {
        
        case charID = "char_id"
        case name = "name"
        case birthday = "birthday"
        case occupation = "occupation"
        case img = "img"
        case status = "status"
        case nickname = "nickname"
        case appearance = "appearance"
        case portrayed = "portrayed"
        case category = "category"
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        charID = try values.decodeIfPresent(Int.self, forKey: .charID)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        birthday = try values.decodeIfPresent(String.self, forKey: .birthday)
        occupation = try values.decodeIfPresent([String].self, forKey: .occupation)
        img = try values.decodeIfPresent(String.self, forKey: .img)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
        appearance = try values.decodeIfPresent([Int].self, forKey: .appearance)
        portrayed = try values.decodeIfPresent(String.self, forKey: .portrayed)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        betterCallSaulAppearance = try values.decodeIfPresent([Int].self, forKey: .betterCallSaulAppearance)
    }
    
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(charID, forKey: .charID)
//        try container.encode(name, forKey: .name)
//        try container.encode(birthday, forKey: .birthday)
//        try container.encode(occupation, forKey: .occupation)
//        try container.encode(img, forKey: .img)
//        try container.encode(status, forKey: .status)
//        try container.encode(nickname, forKey: .nickname)
//        
//        try container.encode(appearance, forKey: .appearance)
//        try container.encode(portrayed, forKey: .portrayed)
//        try container.encode(category, forKey: .category)
//        try container.encode(betterCallSaulAppearance, forKey: .betterCallSaulAppearance)
//    }
}
