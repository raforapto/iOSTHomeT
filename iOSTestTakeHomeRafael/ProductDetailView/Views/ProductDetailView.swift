//
//  ProductDetailView.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 09/10/2022.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
   
    var body: some View {
        ScrollView {
            VStack {
                
                VStack(alignment: .leading){
                    
                    AsyncImage(url: URL(string:"https:\(product.primaryImageMap.large.url)")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 500)
                            .frame(maxWidth: .infinity)
                        
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                        
                    }
                    Link(destination: URL(string: "https://www.matchesfashion.com/products\(product.url)")!) {
                        Image(systemName: "link")
                    }
                    
                     Text(product.designer.name)
                         .fontWeight(.semibold)
                         .padding(.leading)
                    Text(product.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
             
                    Divider()
           
                    HStack {
             
                        
                    } .padding(.bottom, 5)
                    
                    
                    
                }
                .background(Color.red.gradient.opacity(0.6))
                .cornerRadius(10)
                .padding()
            }
        }
       
    }
}
