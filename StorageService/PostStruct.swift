//
//  Post.swift
//  Navigation
//
//  Created by Сергей Белкин on 25.06.2022.
//

import Foundation
import UIKit

public struct PostStruct {
    
    public var author: String
    public var description: String
    public var image: String
    public var likes: Int
    public var views: Int

}

public var arrayPosts: [PostStruct] = [
    
    PostStruct(author: "BelkinSK", description: "Яблоки", image: ("apples"), likes: 533, views: 777),
    PostStruct(author: "BelkinSK", description: "Яичница", image: ("eggs"), likes: 234, views: 567),
    PostStruct(author: "BelkinSK", description: "Гранат", image: ("pomegranate"), likes: 992, views: 992),
    PostStruct(author: "BelkinSK", description: "Клубника", image:  ("strawberry"), likes: 100, views: 332),
    PostStruct(author: "BelkinSK", description: "Кукуруза", image: ("corn"), likes: 200, views: 350)
]
