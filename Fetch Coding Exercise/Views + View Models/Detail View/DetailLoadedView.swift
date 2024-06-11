//
//  DetailLoadedView.swift
//  Fetch Coding Exercise
//
//  Created by Chris Lubera on 6/11/24.
//

import SwiftUI

/// A view that displays the details of a ``Dessert``, including an image, ingrdients and instructions
struct DetailLoadedView: View {
  
  /// The ``Dessert`` to be displayed in the view
  let dessert: Dessert?
  
  /// The body containing the view
  var body: some View {
    if let dessert = dessert {
      ScrollView {
        VStack {
          AsyncImage(url: URL(string: dessert.returnImageURL())) { image in
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
          
          ForEach(dessert.returnIngredients().indices, id: \.self) { index in
            HStack {
              Text(dessert.returnIngredients()[index].item)
                .foregroundStyle(.white)
              Spacer()
              Text(dessert.returnIngredients()[index].measure)
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
          Text(dessert.returnInstructions())
            .foregroundStyle(.white)
        }
        .padding()
      }
      .blueBackground()
    } else {
      Text("Dessert is unexpectedly nil")
        .foregroundStyle(.white)
        .blueBackground()
    }
  }
}

#Preview {
  DetailLoadedView(dessert: PreviewObjects.dessert)
}

#Preview {
  DetailLoadedView(dessert: nil)
}
