//
//  ProductDetailView.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 09/10/2022.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var vm = DLwithCombine()
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
                        Spacer()
                        if  vm.setCurr == 0 {
                            Image(systemName: "sterlingsign.square.fill")
                            
                        } else if vm.setCurr == 1 {
                            Image(systemName: "eurosign.square.fill")
                        } else {
                            Image(systemName: "dollarsign.square.fill")
                        }
                        
                        Text("\(product.price.value*vm.selectedConversion, specifier: "%.2f")")
                            .fontWeight(.semibold)
                            .padding(.leading)
                        Spacer()
                         
                        
                    }
                    HStack {
                        Spacer()
                            Image(systemName: "sterlingsign.square.fill")
                        
                            .foregroundColor(vm.selectedConversion != 1 ? Color.secondary : .clear)
                  
                        
                        
                        Text("\(product.price.value, specifier: "%.2f")")
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .foregroundColor(vm.selectedConversion != 1 ? Color.secondary : .clear)
                         
                        Spacer()
                        
                    } .padding(.bottom, 5)
                    
                    
                    
                }
                .background(Color.red.gradient.opacity(0.6))
                .cornerRadius(10)
                .padding()
            }
        }
       
    }
}
