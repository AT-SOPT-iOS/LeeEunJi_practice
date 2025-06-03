//
//  LoginService.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit

final class LoginService {
    static let shared = LoginService()
    private init() {}

    func makeRequestBody(loginId: String, password: String) -> Data? {
        let data = LoginRequestModel(loginId: loginId, password: password)
        return try? JSONEncoder().encode(data)
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: APIKey.loginURL)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        return request
    }
    

    func fetchLogin(loginId: String, password: String) async throws -> LoginResponse {
        guard let body = makeRequestBody(loginId: loginId, password: password) else {
            throw NetworkError.requestEncodingError
        }

        let request = makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }


        do {
            let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
            return decoded
        } catch {
            throw NetworkError.responseDecodingError
        }
    }

    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
