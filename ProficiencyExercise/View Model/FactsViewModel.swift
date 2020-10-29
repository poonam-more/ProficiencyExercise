//
//  FactsViewModel.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import Foundation

class FactsViewModel {
    let factsArray  = Binder([])
    let factsTitle = Binder(" ")
    let isLoading = Binder(true)
    init() {
        fetchWeatherForLocation()
    }
    private func fetchWeatherForLocation() {
        Utils.apiWebSerciceCall(completionHandler: { (factsData, title) in
            guard let factsData = factsData else { return }
            self.factsTitle.value = title!
            self.factsArray.value = factsData.map({return $0})
            self.isLoading.value = false
        })
    }
}
