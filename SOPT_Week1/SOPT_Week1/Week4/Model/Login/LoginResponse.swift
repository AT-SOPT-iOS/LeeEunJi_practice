//
//  LoginResponse.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import Foundation

struct LoginResponse: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: UserIdData?
}

struct UserIdData: Codable {
    let userId: Int
}
