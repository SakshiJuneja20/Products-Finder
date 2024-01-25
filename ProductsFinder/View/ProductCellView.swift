//
//  ProductCellView.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import SwiftUI

struct ProductCellView: View {
    public enum ProductCellViewConstraints: Double {
        case cellImageHeight = 100
        case cellImageWidth = 300
        case detailPageImageHeight = 600
        case detailPageImageWidth = 650
    }

    private var product: Product
    init(product: Product) {
        self.product = product
    }

    var body: some View {
        VStack(alignment: .leading) {
        buildProductImageView(for: product,
                              imageWidth: ProductCellViewConstraints.cellImageWidth.rawValue,
                              imageHeight: ProductCellViewConstraints.cellImageHeight.rawValue)
            ProductInformationCellView(product: product)
        }
        .foregroundColor(.purple)
    }
}

#Preview {
    ProductCellView(product: Product())
}

struct ProductInformationCellView: View {
    private var product: Product
    init(product: Product) {
        self.product = product
    }

    var body: some View {
        VStack(alignment: .leading) {
            ProductTitleAndDescriptionView(product: product)
        }
        .padding(.leading)
    }
}
