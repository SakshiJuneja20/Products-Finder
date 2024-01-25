//
//  ProductView.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 25/01/24.
//

import SwiftUI
import Foundation

struct ProductsListView: View {
    private enum ProductViewConstants: String {
        case navigationTitle = "Products"
        case productMoreInfo = "See more info..."
        case errorWarning = "Sorry, something went wrong. Please try again later!"
    }
    @ObservedObject private var viewModel: ProductsViewModel
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        let products = viewModel.products

        if viewModel.error != nil {
            VStack {
                Text(ProductViewConstants.errorWarning.rawValue)
            }
        } else {
            NavigationView {
                List(products) { product  in
                    ProductCellView(product: product)
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        Text(ProductViewConstants.productMoreInfo.rawValue)
                            .padding(.leading)
                            .foregroundColor(.accentColor)
                            .font(.subheadline)
                    }
                }
                .navigationTitle(ProductViewConstants.navigationTitle.rawValue)
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
}
#Preview {
    ProductsListView(viewModel: ProductsViewModel(service: ProductsAPIService()))
}
