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
    
    // TODO: register production app key
    static let MOB_SMS_APP_KEY = "99e6a2b8a330"
    static let MOB_SMS_APP_SECRET = "425eabec14aeb76c67a43ecd1cbc3005"
    
    #else
    static let API_URL = "http://218.244.147.5"
    static let APP_APPLE_ID = "967592766"
    static let MOB_SMS_APP_KEY = "99e6a2b8a330"
    static let MOB_SMS_APP_SECRET = "425eabec14aeb76c67a43ecd1cbc3005"
    
    #endif
    
    // TODO: register production env pingpp
    static let PINGPP_URL_SCHEME = "onthetallneedthispingpp"

}