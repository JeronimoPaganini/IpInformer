//
//  String+IpValidation.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

import Foundation

extension String {
  
  ///`True` if ip is valid `IPv4`
  func isIPv4() -> Bool {
    var sin = sockaddr_in()
    return self.withCString({ cstring in inet_pton(AF_INET, cstring, &sin.sin_addr) }) == 1
  }

  ///`True` if ip is valid `IPv6`
  func isIPv6() -> Bool {
    var sin6 = sockaddr_in6()
    return self.withCString({ cstring in inet_pton(AF_INET6, cstring, &sin6.sin6_addr) }) == 1
  }

  ///Validates ip string by both standarts `IPv4` & `IPv6`
  ///`True` if ip corresponds to one of standarts
  func isValidIp() -> Bool { return self.isIPv6() || self.isIPv4() }
}

