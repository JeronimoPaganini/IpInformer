//
//  MainViewModel.swift
//  ipInformer (iOS)
//
//  Created by Farid Shabonov on 20.04.2021.
//

import SwiftUI
import Combine
import MapKit

final class MainViewModel: ObservableObject {
  @Published var region = MKCoordinateRegion()
  @Published var annotates = Set<IpModel>()
  @Published var errorMessage: String? = nil
  @Published var showError = false
  
  private var cancellationToken: AnyCancellable?
  
  init() {
    search()
  }
  
  func search(ip: String = "") {
    cancellationToken = ApiQuery.get(ip: ip)
      .mapError({ (error) -> Error in
        self.errorMessage = error.localizedDescription
        self.showError = true
        return error
      })
      .sink(receiveCompletion: { _ in },
            receiveValue: { (ipModel) in
              var ipModel = ipModel
              let center = CLLocationCoordinate2D(latitude: ipModel.lat, longitude: ipModel.lon)
              let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
              self.region = MKCoordinateRegion(center: center, span: span)
              ipModel.id = UUID()
              self.annotates.insert(ipModel)
      })
  }
}
