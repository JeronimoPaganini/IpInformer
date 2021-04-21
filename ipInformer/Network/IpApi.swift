//
//  IpApi.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

import Foundation

final class IpApi {
  ///Since for testing we are using demo `API` access,
  ///we have to use `http` protocol.
  ///`Important!` If we use full access,
  ///we have to set App Transport Security Settings-> Allow Arbitrary Loads -> false and use `https`
  static let endIpPoint = "http://ip-api.com/"
  
  ///If `API` add new graphQL field, just put it here
  enum GraphQLField: String {
    case status = "status"
    case message = "message"
    case country = "country"
    case countryCode = "countryCode"
    case region = "region"
    case regionName = "regionName"
    case city = "city"
    case currency = "currency"
    case zip = "zip"
    case timezone = "timezone"
    case isp = "isp"
    case `as` = "as"
    case lat = "lat"
    case lon = "lon"
  }
  
  ///If `API` add supporting new language, just put it here
  enum ApiLang: String {
    case en = "en"
    case de = "de"
    case es = "es"
    case pt_Br = "pt-BR"
    case fr = "fr"
    case ja = "ja"
    case zh_CN = "zh-CN"
    case ru = "ru"
  }
  
  ///If we need to use some extra paths/endpoints,
  ///`Action` could be scalable by adding a new variable
  struct Action {
    static let json = RouterStruct(urlPath: "json", method: .get, endPoint: endIpPoint)
    static let xml = RouterStruct(urlPath: "xml", method: .get, endPoint: endIpPoint)
  }
}
