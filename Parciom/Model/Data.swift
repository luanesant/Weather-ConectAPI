//
//  Data.swift
//  ParciomApp
//
//  Created by Luane dos Santos on 17/03/21.
//


import Foundation

struct CityData: Decodable {
  var coord: Coord?
  var weather: [Weather?]
  var base: String?
  var main: Main?
  var visibility: Int?
  var wind: Wind?
  var cloud: Clouds?
  var timezone: Int?
  var id: Int?
  var name: String?
  var cod: Int?
}

struct Coord: Decodable {
  var lon: Double?
  var lat: Double?
}

struct Weather: Decodable {
  var id: Int?
  var main: String?
  var description: String?
  var icon: String?
}

struct Main: Decodable {
  var temp: Double?
  var feelslike: Double?
  var temp_min: Double?
  var temp_max: Double?
  var pressure: Double?
  var humidity: Double?
}

struct Wind: Decodable {
  var speed: Double?
  var deg: Int?
}

struct Clouds: Decodable {
  var all: Int?
}
