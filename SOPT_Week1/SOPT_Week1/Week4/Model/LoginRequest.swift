//
//  LoginRequest.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import Foundation

struct LoginRequest: Codable {
    let loginID, password: String

    enum CodingKeys: String, CodingKey {
        case loginID = "loginId"
        case password
    }
}
