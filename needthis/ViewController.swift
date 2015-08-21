//
//  ViewController.swift
//  needthis
//
//  Created by JERRY LIU on 11/8/15.
//  Copyright (c) 2015 ONTHETALL. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,WXApiDelegate {

    @IBOutlet weak var payButton: UIButton!
    
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var SMSBtn: UIButton!
    
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
//                println("request: \(request)")
//                println("response \(response)")
                println("json: \(JSON)")
                println("error: \(error)")
                
                if let charge_json = JSON as? NSObject {
                    // TODO: Pingpp.createPayment......
                    Pingpp.createPayment(charge_json, appURLScheme: AppSecrets.PINGPP_URL_SCHEME, withCompletion: { (result, error) -> Void in
                        println("[Pingpp] result: \(result)")
                        if error != nil {
                            println("[Pingpp error]\(error.code.rawValue)")
                            println("[Pingpp error]\(error.getMsg())")
                        }
                    })
                }
        }
    }
    
    //发送验证码
    @IBAction func SMS(sender: AnyObject) {
        
        self.SMSBtn.userInteractionEnabled = false
        self.SMSBtn.setTitle("等待验证码", forState:UIControlState.Normal)
        self.SMSBtn.setTitleColor(UIColor.grayColor(),forState:.Normal)
        
        SMS_SDK.getVerificationCodeBySMSWithPhone(self.phoneNumber.text, zone: "86", result: {(error) in
            
            if (error != nil)
            {
                println("获取验证码失败，错误描述: \(error.errorDescription)")
                println("获取验证码失败，状态: \(error.errorCode)")
            
            }else{
                println("获取验证码成功")
            }
            
        })
    }

    @IBAction func weChatBtn(sender: AnyObject) {
        
        if WXApi.isWXAppInstalled() == false {
            
            println("没有微信")
            
        }else {
        
            var req = SendAuthReq()
            req.scope = "snsapi_userinfo"
            req.state = "fdf8566e9925ad57fa70dcc639d8b804"
            
            WXApi.sendReq(req)
        }
    }
    
    @IBAction func shareBtn(sender: AnyObject) {
        
        let ctrlr: UIViewController! = self
        let shareImage: UIImage! = UIImage(named: "icon")!
        let shareSnsNames = [UMShareToTencent,UMShareToSina,UMShareToWechatTimeline,UMShareToWechatSession]
        
        
        UMSocialSnsService.presentSnsIconSheetView(ctrlr, appKey: "535e5f0256240baa89078c7f", shareText: "高大象，设计师的家园", shareImage: shareImage, shareToSnsNames: shareSnsNames, delegate: nil)
        
        
    }
}














