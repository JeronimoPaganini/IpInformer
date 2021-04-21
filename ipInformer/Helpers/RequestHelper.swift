//
//  RequestHelper.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 20.04.2021.
//

import Foundation
import Combine

struct RequestHelper {
  
  struct Response<T> {
    let value: T
    let response: URLResponse
  }
  
  func sendRequest<T: Decodable>(to urlRequest: URLRequest, runLoop: RunLoop = .main) -> AnyPublisher<Response<T>, Error> {
    return URLSession.shared
      .dataTaskPublisher(for: urlRequest)
      .tryMap { result -> Response<T> in
        let value = try JSONDecoder().decode(T.self, from: result.data)
        return Response(value: value, response: result.response)
      }
      .receive(on: runLoop)
      .eraseToAnyPublisher()
  }
}
