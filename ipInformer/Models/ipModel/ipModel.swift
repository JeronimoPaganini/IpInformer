//
//  ipModel.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 20.04.2021.
//

import Foundation

struct IpModel: Decodable, Identifiable {
  var id: UUID? = UUID()
  let status: String?
  let country: String?
  let countryCode: String?
  let region: String?
  let regionName: String?
  let city: String?
  let zip: String?
  let lat: Double
  let lon: Double
  let timezone: String?
  let isp: String?
  let org: String?
  let `as`: String?
  let query: String?
  let currency: String?
}
