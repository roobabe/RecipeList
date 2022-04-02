//
//  DataService.swift
//  RecipeList
//
//  Created by Kynda Montero-Langston on 3/31/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        //parse local json file
        
        //Get url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathString is not nil, otherwise
        guard pathString != nil else {
            return [Recipe]()
        }
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //create a data object
            let data = try Data(contentsOf: url)
            //decode the data with the json decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                //add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                //return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
