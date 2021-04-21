//
//  HTTPMethod.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
  case delete = "DELETE"
  case head = "HEAD"
  case options = "OPTIONS"
  case patch = "PATCH"
  case put = "PUT"
  var value: String {
    return self.rawValue
  }
}
