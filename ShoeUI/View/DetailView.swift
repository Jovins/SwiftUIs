//
//  DetailView.swift
//  DetailView
//
//  Created by Jovins on 2021/8/31.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var baseData: BaseViewModel
    var animation: Namespace.ID
    var body: some View {
        if let product = self.baseData.currentProduct, self.baseData.showDetail {
            
            VStack(spacing: 0) {
                // top bar
                HStack {
                    Button {
                        withAnimation {
                            self.baseData.showDetail = false
                        }
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(
                                Color.red, in: Circle()
                            )
                    }
                }
                .foregroundColor(.black)
                .overlay(Image(systemName: "applelogo"))
                .padding(.horizontal)
                .padding(.bottom)
                
                // Shoe Image
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: product.productImage, in: animation) // 转场
                    .frame(width: 250, height: 250)
                    .rotationEffect(.init(degrees: -20))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.white)
            .transition(.opacity)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
