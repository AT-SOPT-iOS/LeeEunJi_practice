//
//  NicknamePatchService.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit

final class NicknamePatchService {
    static let shared = NicknamePatchService()
    private init() {}
    
    func fetchNickname(userId: Int, nickname: String) async throws -> NicknamePatchResponse {
        guard let url = URL(string: APIKey.nicknamePatchURL) else {
            throw NetworkError.requestEncodingError
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(userId)", forHTTPHeaderField: "userId")

        let body = NicknameRequestModel(nickname: nickname)
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }

        do {
            return try JSONDecoder().decode(NicknamePatchResponse.self, from: data)
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
