//
//  UIExtensions.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func from(hex: String?) -> UIColor {
        guard let hexString = hex else {
            return .black
        }
       
        var cString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
       
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
       
        if cString.count != 6 && cString.count != 8 {
            return .black
        }
       
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
       
        if cString.count == 6 {
            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        } else {
            return UIColor(
                red: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0,
                green: CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
                blue: CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0,
                alpha: CGFloat(rgbValue & 0x000000FF) / 255.0
            )
        }
    }
}

extension UIImageView {
    func loadImage(_ url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else { return }
            
            DispatchQueue.main.async() {
                self.image = UIImage(data: data)
            }
        }).resume()
    }
}

extension UITableViewCell {
    func hideSeparator() {
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
}
