//
//  ipModel+Hashable.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

extension IpModel: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(lat)
    hasher.combine(lon)
  }
}
