//
//  RegisterService.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/3/25.
//

import UIKit

class RegisterService {
    static let shared = RegisterService()
    private init() {}
    
    func makeRequestBody(loginId: String,
                         password: String,
                         nickname: String) -> Data? {
        do {
            let data = RegisterRequestModel(loginId: loginId, password: password, nickname: nickname)
            
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print("\(error)")
            return nil
        }
    }
    
    func makeRequest(body: Data?) -> URLRequest {
        let url = URL(string: "\(APIKey.registerURL)")!
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
    
    func PostRegisterDate(loginId: String,
                          password: String,
                          nickname: String) async throws -> RegisterResponseBody {
        guard let body = makeRequestBody(loginId: loginId,
                                         password: password,
                                         nickname: nickname) else {
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
            let decoded = try JSONDecoder().decode(RegisterResponseWrapper.self, from: data)
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
