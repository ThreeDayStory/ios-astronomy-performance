//
//  FilterImageOperation.swift
//  Astronomy
//
//  Created by Jessie Ann Griffin on 4/9/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class FilterImageOperation: Operation {
    let fetchOperation: FetchPhotoOperation
    var filteredImage: UIImage?
    
    init(fetchOperation: FetchPhotoOperation) {
        self.fetchOperation = fetchOperation
    }
    
    override func main() {
        // once we being executing:
        // 1. make sure there's data
        // 2. the data that's downloaded is an actual image
        guard
            let fetchedImageData = fetchOperation.imageData,
            let fetchedImage = UIImage(data: fetchedImageData) else {
                print("No data or data is not an image")
                return
        }
        
        filteredImage = fetchedImage.filtered()
    }

}
