//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Farid Shabonov on 20.04.2021.
//

import XCTest

class Tests_iOS: XCTestCase {
  var ipv4cases: [(ip: String, expected: Bool)] = []
  var ipv6cases: [(ip: String, expected: Bool)] = []
  
  override func setUp() {
    super.setUp()
    ipv4cases = [
      (ip: "", expected: false),
      (ip: "2.17.203.255", expected: true),
      (ip: "-2.17.203.255", expected: false),
      (ip: "2.17.203.", expected: false),
      (ip: "999.17.203.255", expected: false),
      (ip: "255.255.255.255", expected: true),
      (ip: "256.255.255.255", expected: false),
      (ip: "255.256.255.255", expected: false),
      (ip: "255.255.256.255", expected: false),
      (ip: "255.255.255.256", expected: false),
      (ip: "2323.255.255.256", expected: false),
      (ip: "asdsa.255.255.256", expected: false),
      (ip: " ", expected: false),
      (ip: " . . . ", expected: false),
      (ip: "*.*.*.*", expected: false),
    ]
    
    ipv6cases = [
      (ip: "2a02:5940:1210:2:4d62:84de:57c8:55e2", expected: true),
      (ip: "2a02:5940:1210:2:225:90ff:fefc:80a0", expected: true),
      (ip: "2001:2030:0:2f::c001", expected: true),
      (ip: "2001:2030:0:2f::b001", expected: true),
      (ip: "2a04:b80:1:3::10", expected: true),
      (ip: "2001:ac8:27:3c::2", expected: true),
      (ip: "2a02:67e0:0:1::10", expected: true),
      (ip: "2a-2:67e0:0:1::10", expected: false),
      (ip: "2a2:67e0:0..1::10", expected: false),
      (ip: "2a2:67e0:0.1:::10", expected: false),
      (ip: "-2a2:67e0:0.1::10", expected: false),
    ]
  }
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testUrlConfigurator() {
    let case1 = IpApi.Action.json.urlRequest(with: "55.55.55.55", fields: [], lang: .pt_Br)
    
    let case2 = IpApi.Action.json.urlRequest(with: "2.17.203.255", fields: [.country, .city], lang: .fr)
    
    let cases = [
      (result: case1.url?.absoluteString, expected: "http://ip-api.com/json/55.55.55.55?lang=pt-BR"),
      (result: case2.url?.absoluteString, expected: "http://ip-api.com/json/2.17.203.255?fields=country,city&lang=fr"),
    ]
    for touple in cases {
      assert(touple.expected == touple.result,
             "Expected \(touple.expected), Result \(String(describing: touple.result))")
    }
  }
  
  func testIpV6Detector() {
    for touple in ipv6cases {
      assert(touple.expected == touple.ip.isIPv6(), "Expected \(touple.expected), Result \(touple.ip.isIPv6()) for ip \(touple.ip)")
    }
  }
  
  func testIpV4Detector() {
    for touple in ipv4cases {
      assert(touple.expected == touple.ip.isIPv4(), "Expected \(touple.expected), Result \(touple.ip.isIPv4()) for ip \(touple.ip)")
    }
  }

  func testGeneralIpValidations() {
    for touple in ipv4cases + ipv6cases {
      assert(touple.expected == touple.ip.isValidIp(), "Expected \(touple.expected), Result \(touple.ip.isValidIp()) for ip \(touple.ip)")
    }
  }
  
  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
