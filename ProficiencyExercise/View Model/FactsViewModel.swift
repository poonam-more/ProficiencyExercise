//
//  FactsViewModel.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation

struct FactsViewModel {
    let factTitle: String?
    let factDescription: String?
    let factimage: String?
    
    init(rows:Rows) {
        self.factTitle = rows.title
        self.factDescription = rows.description
        self.factimage = rows.imageHref
    }
}
