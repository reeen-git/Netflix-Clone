//
//  Extensinons.swift
//  NetflixClone
//
//  Created by 高橋蓮 on 2022/02/25.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
