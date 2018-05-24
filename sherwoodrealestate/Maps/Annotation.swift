//
//  Annotation.swift
//  sherwoodrealestate
//
//  Created by Alex Beattie on 5/21/18.
//  Copyright © 2018 Alex Beattie. All rights reserved.
//

import MapKit
import Contacts

class ListingAnno: NSObject, MKAnnotation {
    var listing: Listing?
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let locationName: String?
    
    init(title:String, coordinate: CLLocationCoordinate2D, locationName:String) {
        self.title = title
        self.coordinate = coordinate
        self.locationName = locationName
        super.init()
    }
    
    class func fromDataArray(dictionary: [String:Any]!)->ListingAnno {
        var latitude:Double = 0.0
        var longitude:Double = 0.0
        var title = ""
        let locationName = ""
        if let theAddress = dictionary["address"] as? [String:Any]  {
            if let fullAddress = theAddress["full"] as? String {
                title = fullAddress
            }
        }
        let geo = dictionary["geo"] as? [String:Any]
        let theLng = geo!["lng"] as? Double
        let theLat = geo!["lat"] as? Double
        longitude = theLng!
        latitude = theLat!
        let location2d:CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: theLat!, longitude: theLng!)
        return ListingAnno.init(title: title, coordinate: location2d, locationName: locationName)
    }
}


