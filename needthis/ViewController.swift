//
//  ViewController.swift
//  needthis
//
//  Created by JERRY LIU on 11/8/15.
//  Copyright (c) 2015 ONTHETALL. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var payButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPay(sender: AnyObject) {
        let request_url = "\(AppSecrets.API_URL)/charges"
        
        // charges params
        let charge_key = NSUUID().UUIDString // instantiate key
        let amount = 10000 // $100.00
        let subject = "ios test subject"
        let body = "ios test body"
        let request_params = ["charge": ["key": charge_key, "amount": amount, "subject": subject, "body": body]]
        
        // authenticate
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-API-EMAIL": "hello@foo.com",
            "X-API-TOKEN": "oKupWQgZxx8AFJhcAzM1qKVy2hh-8kRgdQ"
        ]
        println("request_url: \(request_url), params: \(request_params), headers: \(headers)")
        
        Alamofire.request(.POST, request_url, parameters: request_params, encoding: .JSON, headers: headers)
            .responseJSON { request, response, JSON, error in
                println("request: \(request)")
                println("response \(response)")
                println("json: \(JSON)")
                println("error: \(error)")
                println("response: \(response)")
        }
    }
    

}

