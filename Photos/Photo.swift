//
//  Photo.swift
//  Navigation
//
//  Created by Петр Макаров on 23.05.2022.
//

import Foundation

import UIKit

struct Photo {
    let image: UIImage?
    
    static func makePhoto() -> [Photo] {
        var photo = [Photo]()
        photo.append(Photo(image: UIImage(named: "1")))
        photo.append(Photo(image: UIImage(named: "2")))
        photo.append(Photo(image: UIImage(named: "3")))
        photo.append(Photo(image: UIImage(named: "4")))
        photo.append(Photo(image: UIImage(named: "5")))
        photo.append(Photo(image: UIImage(named: "6")))
        photo.append(Photo(image: UIImage(named: "7")))
        photo.append(Photo(image: UIImage(named: "8")))
        photo.append(Photo(image: UIImage(named: "9")))
        photo.append(Photo(image: UIImage(named: "10")))
        photo.append(Photo(image: UIImage(named: "11")))
        photo.append(Photo(image: UIImage(named: "12")))
        photo.append(Photo(image: UIImage(named: "13")))
        photo.append(Photo(image: UIImage(named: "14")))
        photo.append(Photo(image: UIImage(named: "15")))
        photo.append(Photo(image: UIImage(named: "16")))
        photo.append(Photo(image: UIImage(named: "17")))
        photo.append(Photo(image: UIImage(named: "18")))
        photo.append(Photo(image: UIImage(named: "19")))
        photo.append(Photo(image: UIImage(named: "20")))
        return photo
    }
}
