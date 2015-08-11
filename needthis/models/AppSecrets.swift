//
//  AppSecrets.swift
//  needthis
//
//  Created by JERRY LIU on 11/8/15.
//  Copyright (c) 2015 ONTHETALL. All rights reserved.
//

import Foundation

struct AppSecrets {
    
    #if PRODUCTION_API
    static let API_URL = "http://onthetall.com"
    static let APP_APPLE_ID = "967588593"
    #else
    
    static let API_URL = "http://218.244.147.5"
    static let APP_APPLE_ID = "967592766"
    #endif
    

}