//
//  ApiQuery.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 20.04.2021.
//

import Foundation
import Combine

final class ApiQuery {
  private static let requestHelper = RequestHelper()
  
  static func getInfo(by ip: String) -> AnyPublisher<IpModel, Error> {
    let fields: [IpApi.GraphQLField] = [.city,
                  .country,
                  .region,
                  .lat,
                  .lon,
                  .currency,
                  .isp,
                  .as]
    /**
      fields and lang parameters are not required, so we can use it just like:
      IpApi.Action.json.urlRequest IpApi.Action.json.urlRequest(with: ip)
    */
    let urlRequest = IpApi.Action.json.urlRequest(with: ip, fields: fields, lang: .en)
    return requestHelper
      .sendRequest(to: urlRequest)
      .map(\.value)
      .eraseToAnyPublisher()
  }
}
