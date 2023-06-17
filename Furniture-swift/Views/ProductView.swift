//
//  ProductView.swift
//  Furniture-swift
//
//  Created by Kemal Maulana on 18/06/23.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCardView(product: product)
                    }
                }
                .padding()
            }
//            .navigationTitle(Text("All Furniture"))
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .environmentObject(CartManager())
    }
}
