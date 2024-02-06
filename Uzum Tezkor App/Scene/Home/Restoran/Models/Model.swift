//
//  RestaurantModel.swift
//  Uzum Tezkor App
//
//  Created by islombek on 29/01/24.
//

import Foundation

struct MainModel {
    var category: [RestaurantCategory]
    var recomendation: [RestaurantRecomendation]
    var restaurants: [RestaurantModel]
}

struct RestaurantRecomendation {
    let imageName: String
    let title: String
}

struct RestaurantCategory {
    let imageName: String
}

struct RestaurantModel {
    let imageName: String
    let title: String
}
