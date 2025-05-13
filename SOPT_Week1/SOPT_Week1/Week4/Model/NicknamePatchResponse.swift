//
//  NicknamePatchResponse.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import Foundation

struct NicknamePatchResponse: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: String?
}
