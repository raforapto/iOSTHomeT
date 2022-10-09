//
//  ProductsView.swift
//  iOSTestTakeHomeRafael
//
//  Created by Rafael Mirza on 06/10/2022.
//

// cRIFYrFyplclpnV0ZLSaXV50Hz1NlIVA

import SwiftUI

struct ProductsView: View {
    @StateObject var vm = DLwithCombine()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                
                if vm.results == nil {
                    ProgressView()
                } else {
                    HeaderButtons
                    ContentColumns
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("iOS Take Home Test")
                        .font(.title3)
                        .fontWeight(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "cart")
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        if  vm.setCurr == 0 {
                            Image(systemName: "sterlingsign.square.fill")
                        } else if vm.setCurr == 1 {
                            Image(systemName: "eurosign.square.fill")
                        } else {
                            Image(systemName: "dollarsign.square.fill")
                        }
                        Image(systemName: "arrow.down")
                    }
                    .padding(2)
                    .background {
                        
                        Color.gray.opacity(0.3)
                            .cornerRadius(10)
                    }
                
                }
            }
            
        }
        
     
    }
   
}


struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}

extension ProductsView {
    
    
    private var ContentColumns: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(vm.results!.results) { product in
                VStack(alignment: .leading){
                    
                    AsyncImage(url: URL(string:"https:\(product.primaryImageMap.large.url)")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                        
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                        
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
                
                
            }
        }
        .padding(.horizontal, 6)
    }
    private var HeaderButtons: some View {
        HStack {
            Button {
                vm.selectedConversion = (vm.conversions?.rates.gbp)!
                vm.setCurr = 0
            } label: {
                HStack {
                    Text("GBP")
                    Image(systemName: "sterlingsign.square.fill")
                }
                
            }
            Button {
                vm.selectedConversion = (vm.conversions?.rates.eur)!
                vm.setCurr = 1
            } label: {
                HStack {
                    Text("EUR")
                    Image(systemName: "eurosign.square.fill")
                }
            }
            Button {
                vm.selectedConversion = (vm.conversions?.rates.usd)!
                vm.setCurr = 2
            } label: {
                HStack {
                    Text("USD")
                    Image(systemName: "dollarsign.square.fill")
                }
            }
            
        }
    }
}
