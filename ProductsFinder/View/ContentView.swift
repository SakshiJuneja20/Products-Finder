//
//  ContentView.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @StateObject var viewModel = ProductsViewModel(service: ProductsAPIService())
    
    var body: some View {
        let products = viewModel.products
        NavigationView {
            List(products) { product  in
                ProductCellView(products: product)
                NavigationLink(destination: ProductDetailsView(products: product)) {
                    Text("See more info...")
                        .padding(.leading)
                        .foregroundColor(.accentColor)
                        .font(.subheadline)
                    
                }
            }
            .navigationTitle("Products")
            .onAppear {
                if viewModel.products.isEmpty {
                    Task {
                        try await viewModel.loadAllProducts()
                    }
                }
            }
        }
        
    }
    
}


#Preview {
    ContentView()
}
