//
//  ProductsFinderApp.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import SwiftUI

@main
struct ProductsFinderApp: App {
    var body: some Scene {
        WindowGroup {
            ProductsListView(viewModel: ProductsViewModel(service: ProductsAPIService()))
        }
    }
}
