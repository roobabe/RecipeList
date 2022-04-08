//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Kynda Montero-Langston on 4/1/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var servingSize = 2
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                //MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                //MARK: Recipe Title
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    .padding(.top, 20)
                
                //MARK: Serving Size Picker
                VStack (alignment: .leading) {
                    Text("Select your serving size:")
                    Picker ("", selection: $servingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding(.vertical)
                .padding([.leading, .trailing])
                
                //MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    ForEach(recipe.ingredients) {i in
                        Text(String("• ") + RecipeModel.getPortion(ingredient: i, recipeServings: recipe.servings, targetServings: servingSize) + " " + i.name.lowercased())
                    }
                }
                .padding(.vertical)
                .padding([.leading, .trailing])
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
                .padding([.leading, .trailing])
                
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
