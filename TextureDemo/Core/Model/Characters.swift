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
	let betterCallSaulAppearance : [String]?

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
}
