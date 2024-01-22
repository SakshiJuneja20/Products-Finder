//
//  ProductCellView.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import SwiftUI

struct ProductCellView: View {
    var products: ProductsListResponse
    var body: some View {
        let url = URL(string: products.thumbnail ?? "")
        VStack(alignment: .leading) {
            AsyncImage(
                url: url,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 100)
                        .clipShape(Circle())
                },
                placeholder: {
                    ProgressView()
                }
            )
            VStack(alignment: .leading) {
                
                Text(products.title ?? "")
                    .bold()
                    .lineLimit(1)
                
                Text(products.productDescription ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(5)
            }
            .padding(.leading)
        }
        .foregroundColor(.purple)
    }
}

#Preview {
    ProductCellView(products: ProductsListResponse())
}
