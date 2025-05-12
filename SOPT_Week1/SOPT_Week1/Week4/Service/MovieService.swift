//
//  MovieService.swift
//  SOPT_Week1
//
//  Created by 이은지 on 5/13/25.
//

import UIKit

final class MovieService {
    static let shared = MovieService()
    private init() {}
    
    func makeRequest(keyword: String?) -> URLRequest? {
        var urlString = "\(APIKey.movieURL)\(APIKey.movieAPIKey)&targetDt=20250511"

        if let keyword = keyword, !keyword.isEmpty,
           let encoded = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            urlString += "&keyword=\(encoded)"
        }

        guard let url = URL(string: urlString) else { return nil }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func fetchMovieList(keyword: String?) async throws -> [WeeklyBoxOfficeList] {
        guard let request = makeRequest(keyword: keyword) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }
        
        do {
            let decoded = try JSONDecoder().decode([String: BoxOfficeResult].self, from: data)
            return decoded["boxOfficeResult"]?.weeklyBoxOfficeList ?? []

        } catch {
            print("디코딩 실패 ", error)
            throw NetworkError.responseDecodingError
        }
    }
}
