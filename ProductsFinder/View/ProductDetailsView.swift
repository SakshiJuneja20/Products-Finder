//
//  ProductDetailsView.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 20/01/24.
//

import SwiftUI

struct ProductDetailsView: View {
    var products: ProductsListResponse
    
    var body: some View {
        ScrollView {
            let url = URL(string: products.thumbnail ?? "")
            VStack(alignment: .leading) {
                AsyncImage(
                    url: url,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 600, maxHeight: 600)
                            .clipShape(Circle())
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                VStack(alignment: .leading, spacing: 40) {
                    Text(products.title ?? "")
                        .bold()
                        .lineLimit(1)
                    
                    Text(products.productDescription ?? "")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(5)
                    
                    HStack(spacing: 15) {
                        Text("Price:")
                            .bold()
                            .lineLimit(1)
                        
                        Text("\(products.price ?? 0)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(5)
                    }
                    HStack(spacing: 15) {
                        Text("Rating:")
                            .bold()
                            .lineLimit(1)
                        
                        Text("\(products.rating ?? 0)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(5)
                    }
                    
                }
                .padding(.leading)
            }
            .padding()
        }
        .navigationTitle(products.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetailsView(products: ProductsListResponse())
}
