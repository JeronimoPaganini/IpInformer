//
//  ContentView.swift
//  Shared
//
//  Created by Farid Shabonov on 20.04.2021.
//

import SwiftUI
import Combine
import MapKit

struct MainView: View {
  @StateObject var viewModel = MainViewModel()
  @State private var searchableIP = ""
  @State private var ipIsNotValid = false
  
  init() {
    UITextField.appearance().clearButtonMode = .whileEditing
  }
  
  var body: some View {
    Spacer()
    searchField
      .padding(.horizontal, 25)
      .padding(.top, 50)
      .textFieldStyle(RoundedBorderTextFieldStyle())
    Spacer()
    
    if ipIsNotValid && searchableIP != "" {
      Text(•"ipIsNotValid")
        .foregroundColor(.orange)
      Spacer()
    }
    
    Map(coordinateRegion: $viewModel.region,
        annotationItems: Array(viewModel.annotates)) { (annotate) -> MapAnnotation<MarkerView> in
      MapAnnotation(coordinate: viewModel.region.center, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
        MarkerView(annotate: annotate)
      }
    }
    .cornerRadius(20)
    .ignoresSafeArea(.all)
  }
  
  private var ipStringProxy: Binding<String> {
    Binding<String>(
      get: { searchableIP },
      set: {
        ipIsNotValid = !$0.isValidIp()
        searchableIP = $0
      }
    )
  }
  
  private var searchField: some View {
    TextField(•"ipFieldPlaceholder", text: ipStringProxy, onCommit:  {
      guard !ipIsNotValid || searchableIP.isEmpty else { return }
      viewModel.search(ip: searchableIP)
    })
    .keyboardType(.numbersAndPunctuation)
    .alert(isPresented: $viewModel.showError){
      Alert(title: Text(•"error"),
            message: Text(viewModel.errorMessage ?? ""))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
