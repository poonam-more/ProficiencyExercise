//
//  Utils.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation

public class Utils: NSObject {
    static func apiWebSerciceCall(completionHandler: @escaping ([Rows]?, String?) -> ()) {
        let url = Constants.jsonURL
        let urlObj = URL(string: url)!
        _ = URLSession.shared.dataTask(with: urlObj) {(data, responds, error) in
            guard let data = data else { return }
            guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
            guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
            do {
                let jsonResult = try JSONDecoder().decode(Response.self, from: properData)
                let rowArray = jsonResult.rows
                var finalRowArray = [Rows]()
                for item in rowArray {
                    if (item.title?.count ?? 0 > 0) {
                        finalRowArray.append(item)
                    }
                }
                let rowTitle = jsonResult.title
                completionHandler(finalRowArray, rowTitle ?? "")
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
