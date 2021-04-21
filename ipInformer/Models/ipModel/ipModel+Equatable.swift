//
//  ipModel+Equatable.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

extension IpModel: Equatable {
  static func ==(lhs: IpModel, rhs: IpModel) -> Bool {
    return lhs.lat == rhs.lat && lhs.lon == rhs.lon
  }
}

