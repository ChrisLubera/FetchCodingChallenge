//
//  DetailView.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/6/24.
//

import SwiftUI

/// A view that will display information about a ``Dessert`` object
struct DetailView: View {
  
  /// The ``DetailViewModel`` that will power the view
  @StateObject var viewModel: DetailViewModel
  
  /// The body containing the information
  var body: some View {
    ZStack {
      Color("LightBlue")
        .ignoresSafeArea()
      
      if viewModel.dessert != nil {
        ScrollView {
          VStack {
            AsyncImage(url: URL(string: viewModel.dessert!.returnImageURL())) { image in
              image
                .resizable()
                .scaledToFill()
            } placeholder: {
              VStack {
                ProgressView()
              }
            }
            .frame(width: 200, height: 200)
            .scaledToFill()
            .padding(.bottom, 10)
            
            HStack {
              Text("Ingredients")
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.semibold)
              Spacer()
            }
            
            ForEach(viewModel.dessert!.returnIngredients().indices, id: \.self) { index in
              HStack {
                Text(viewModel.dessert!.returnIngredients()[index].item)
                  .foregroundStyle(.white)
                Spacer()
                Text(viewModel.dessert!.returnIngredients()[index].measure)
                  .foregroundStyle(.white)
              }
              .background((index  % 2 == 0) ? Color("AppPink") : Color.clear)
            }
            
            HStack {
              Text("Instructions")
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 10)
              Spacer()
            }
            Text(viewModel.dessert!.returnInstructions())
              .foregroundStyle(.white)
          }
          .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.name)
      } else {
        ProgressView()
          .navigationBarTitleDisplayMode(.inline)
          .navigationTitle(viewModel.name)
      }
    }
  }
}

#Preview {
  DetailView(viewModel: DetailViewModel(id: "53049", name: "Test"))
}
