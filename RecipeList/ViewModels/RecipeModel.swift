//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Kynda Montero-Langston on 3/31/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
        
    }
}
