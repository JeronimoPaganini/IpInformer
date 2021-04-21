//
//  RouterStruct.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

import Foundation

struct RouterStruct {
  let urlPath: String
  let method: HTTPMethod
  let endPoint: String
  
  func urlRequest(with parameter: String, fields: [IpApi.GraphQLField] = [], lang: IpApi.ApiLang = .en) -> URLRequest {
    var urlComponents = URLComponents(string: endPoint)!
    urlComponents.path.append(urlPath + "/")
    urlComponents.path.append(parameter)
    urlComponents.queryItems = []

    if !fields.isEmpty {
      let graphFields = fields.map({ $0.rawValue }).joined(separator: ",")
      urlComponents.queryItems?.append(URLQueryItem(name: "fields", value: graphFields))
    }
    urlComponents.queryItems?.append(URLQueryItem(name: "lang", value: lang.rawValue))
    
    var request = URLRequest(url: urlComponents.url!)
    request.httpMethod = method.rawValue
    request.timeoutInterval = 30
    return request
  }
}
