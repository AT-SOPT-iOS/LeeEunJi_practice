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
    
    func makeRequestBody(loginID: String,
                         password: String) -> Data? {
        do {
            let data = LoginRequestModel(loginID: loginID, password: password)
            
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print("\(error)")
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "\(APIKey.loginURL)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }
    
    func PostRegisterDate(loginID: String,
                          password: String) async throws -> LoginRequestModel? {
        guard let body = makeRequestBody(loginID: loginID,
                                         password: password) else {
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
            return decoded.data
        } catch {
            print("디코딩 실패: ", error)
            throw NetworkError.responseDecodingError
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
