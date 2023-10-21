//
//  ContentView.swift
//  Appetizers
//
//  Created by Eidmone Tagaca on 10/20/23.
//

import SwiftUI

struct AppetizerTabView: View {
  var body: some View {
    TabView {
      AppetizerListView()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }

      AccountView()
        .tabItem {
          Image(systemName: "person")
          Text("Account")
        }

      AppetizerListView()
        .tabItem {
          Image(systemName: "bag")
          Text("Order")
        }
    }
    .accentColor(Color("brandPrimary"))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerTabView()
  }
}
