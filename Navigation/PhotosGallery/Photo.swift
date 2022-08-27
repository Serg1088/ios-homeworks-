//
//  Photo.swift
//  Navigation
//
//  Created by Сергей Белкин on 01.07.2022.
//

import Foundation
import UIKit

var photosCollection: [UIImage] {
    var photos = [UIImage]()
    for n in 1...20 {
        photos.append(UIImage(named: "\(n)")!)
    }
    return photos
}
