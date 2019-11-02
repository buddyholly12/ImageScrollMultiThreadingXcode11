//
//  DemoURLs.swift
//  
//
// 
//  
//

import Foundation

struct DemoURLs
{
    static let sby = Bundle.main.url(forResource: "Sby", withExtension: "jpg")
    
    static var animals: Dictionary<String,URL> = {
        let animalURLStrings = [
            "Elephant" : "https://cdn.pixabay.com/photo/2016/11/14/04/45/elephant-1822636_1280.jpg",
            "Gorilla" : "https://cdn.pixabay.com/photo/2014/09/16/20/52/gorilla-448731_1280.jpg",
            "Lion" : "https://cdn.pixabay.com/photo/2012/03/04/00/09/africa-21787_1280.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in animalURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
