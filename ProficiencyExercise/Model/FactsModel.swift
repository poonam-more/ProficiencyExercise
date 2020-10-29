//
//  FactsModel.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation

struct Response: Decodable {
    let rows: [Rows]
    let title: String?
}

struct Rows: Decodable {
    let title: String?
    let description: String?
    let imageHref: String?
}
