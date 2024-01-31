//
//  ProductDetailsView.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import SwiftUI

struct ProductDetailsView: View {
    private enum ProductDetailsViewConstraints: Double {
        case detailPageImageHeight = 600
        case detailPageImageWidth = 650
    }
    private var product: Product

    init(product: Product) {
        self.product = product
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
        buildProductImageView(for: product,
                              imageWidth: ProductDetailsViewConstraints.detailPageImageWidth.rawValue,
                              imageHeight: ProductDetailsViewConstraints.detailPageImageHeight.rawValue)
                ProductInformationDetailsView(product: product)
            }
            .padding()
        }
        .navigationTitle(product.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetailsView(product: Product())
}

struct ProductInformationDetailsView: View {
    private enum ProductInformationViewConstants: String {
        case productsPriceText = "Price:"
        case productsRatingText = "Rating:"
    }
    private var product: Product

    init(product: Product) {
        self.product = product
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            ProductTitleAndDescriptionView(product: product)
    ProductDetailsPriceAndRatingView(title: ProductInformationViewConstants.productsPriceText.rawValue,
                                     value: "\(product.price ?? 0)")
    ProductDetailsPriceAndRatingView(title: ProductInformationViewConstants.productsRatingText.rawValue,
                                     value: "\(product.rating ?? 0)")
        }
        .padding(.leading)
    }
}

struct ProductTitleAndDescriptionView: View {
    private var product: Product

    init(product: Product) {
        self.product = product
    }

    var body: some View {
        buildReusableTextComponent(title: product.title ?? "", value: product.productDescription ?? "")
    }
}

struct ProductDetailsPriceAndRatingView: View {
    private var title: String
    private var value: String

    init(title: String, value: String) {
        self.title = title
        self.value = value
    }

    var body: some View {
        HStack(spacing: 15) {
            buildReusableTextComponent(title: title, value: value)
        }
    }
}

@ViewBuilder
func buildReusableTextComponent(title: String, value: String) -> some View {
    Text(title)
        .bold()
        .lineLimit(1)
    Text(value)
        .font(.caption)
        .foregroundColor(.secondary)
        .lineLimit(5)
}
