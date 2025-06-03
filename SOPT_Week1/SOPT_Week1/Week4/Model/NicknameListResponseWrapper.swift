//
//  NicknameListResponseWrapper.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/3/25.
//

struct NicknameListResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: NicknameListResponseModel
}

struct NicknameListResponseModel: Codable {
    let nicknameList: [String]
}
