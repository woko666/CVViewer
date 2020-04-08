//
//  CVServiceImpl.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class CVServiceImpl: CVService {
    func loadCv(success: @escaping (CVData) -> Void, failure: @escaping () -> Void) {
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil

        let session = URLSession.init(configuration: config)
        session.dataTask(with: Config.cvUrl) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil,
                let cv = JsonTools.decodeString(CVData.self, from: data, formatter: JsonTools.ymdFormatter)
            else {
                DispatchQueue.main.async {
                    failure()
                }
                return
            }
            DispatchQueue.main.async {
                success(cv)
            }
        }.resume()
    }
    
    
}
