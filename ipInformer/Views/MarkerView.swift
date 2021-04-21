//
//  MarkerView.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 21.04.2021.
//

import SwiftUI

struct MarkerView: View {
  @State private var presentDetails = false
  var annotate: IpModel
    
  var body: some View {
    Triangle()
      .fill(Color.red)
      .frame(width: 30, height: 30)
      .sheet(isPresented: $presentDetails) {
        listOfLoadedFields
      }
      .onTapGesture {
        presentDetails = true
      }
  }
  
  private var listOfLoadedFields: some View {
    VStack(alignment: .leading) {
      if let country = annotate.country {
        Text(•"country"+": \(country)")
      }
      if let currency = annotate.currency {
        Text(•"currency"+": \(currency)")
      }
      if let countryCode = annotate.countryCode {
        Text(•"countryCode"+": \(countryCode)")
      }
      if let region = annotate.region {
        Text(•"region"+": \(region)")
      }
      if let regionName = annotate.regionName {
        Text(•"regionName"+": \(regionName)")
      }
      if let city = annotate.city {
        Text(•"city"+": \(city)")
      }
      if let zip = annotate.zip {
        Text(•"zip"+": \(zip)")
      }
      if let timezone = annotate.timezone {
        Text(•"timezone"+": \(timezone)")
      }
      if let isp = annotate.isp {
        Text(•"isp"+": \(isp)")
      }
      if let `as` = annotate.as {
        Text(•"as"+": \(`as`)")
      }
    }
  }
}
