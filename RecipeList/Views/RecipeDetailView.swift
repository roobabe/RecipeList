//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Kynda Montero-Langston on 4/1/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack {
                //MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 1.0)
                    ForEach(recipe.ingredients) {i in
                        Text(String("• ") + i.name)
                    }
                }
                .padding(.horizontal, 1.0)
                //MARK: Divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 1.0)
                    ForEach(0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                    }
                }
                .padding(.horizontal, 1.0)
                
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
