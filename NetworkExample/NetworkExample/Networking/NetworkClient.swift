//
//  NetworkClient.swift
//  NetworkExample
//
//  Created by Chandan on 11/09/23.
//

import Foundation


protocol NetworkClient {
    func sendRequest<T: Decodable> (networkRequest: NetworkRequest, model: T.Type) async -> Result<T, NetworkError>
}

extension NetworkClient {
    func sendRequest<T: Decodable> (networkRequest: NetworkRequest, model: T.Type) async -> Result<T, NetworkError> {

        guard let url = URL(string: networkRequest.baseURL + "/" + networkRequest.path) else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = networkRequest.httpMethod.rawValue
        request.allHTTPHeaderFields = networkRequest.header

        if let body = networkRequest.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }

            if response.statusCode == 200 {
                guard let decodedResponse = try? JSONDecoder().decode(model, from: data) else {
                    return .failure(.noResponse)
                }
                return .success(decodedResponse)
            }
            return .failure(.unknown)
        } catch {
            return .failure(.unknown)
        }
    }
}
