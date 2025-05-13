//
//  LoginRequestModel.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import Foundation

struct LoginRequestModel: Codable {
    let loginId, password: String

    enum CodingKeys: String, CodingKey {
        case loginId = "loginId"
        case password
    }
}
