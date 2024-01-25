//
//  ProductImageView.swift
//  ProductsFinder
//
//  Created by Sakshi Juneja on 26/01/24.
//

import SwiftUI

@ViewBuilder
func buildProductImageView(for item: Product, imageWidth: Double, imageHeight: Double ) -> some View {
    let imageUrl = URL(string: item.thumbnail ?? "")
    AsyncImage(
        url: imageUrl,
        content: { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: imageWidth, maxHeight: imageHeight)
                .clipShape(Circle())
        },
        placeholder: {
            ProgressView()
        }
    )
}
