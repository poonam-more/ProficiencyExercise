//
//  Utils.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation

public class Utils: NSObject {
    static func apiWebSerciceCall(completionHandler: @escaping ([Rows]?, String?) -> Void) {
        let url = Constants.jsonURL
        let urlObj = URL(string: url)!
      _ = URLSession.shared.dataTask(with: urlObj) {(data, _, _) in
            guard let data = data else { return }
            guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
            guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
            do {
                let jsonResult = try JSONDecoder().decode(Response.self, from: properData)
                let rowArray = jsonResult.rows
                var finalRowArray = [Rows]()
              if rowArray.count > 0 {
                for item in rowArray {
                    finalRowArray.append(item)
                }
              }
                let rowTitle = jsonResult.title
                completionHandler(finalRowArray, rowTitle ?? "")
            } catch {
            }
        }.resume()
    }
}
