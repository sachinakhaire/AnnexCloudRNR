//
//  SeeAllMyReviewViewController.swift
//  RNRSDK_Swift
//
//  Created by MacMini3 on 05/04/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//

import UIKit
import QuartzCore
import Reachability
import Alamofire

typealias RNRResponseHandler = (_ result: [AnyHashable: Any]?, _ error: Error?) -> Void

class SeeAllMyReviewViewController: UIViewController,URLSessionDelegate {
    
    public var globalArray = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        [0][1] // Program crash forcefully
//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.loadMoreButtonClicked), userInfo: nil, repeats: false)
        
        
        var responseDictionaryForProductRating: [AnyHashable: Any]? = nil
        var kProductRatingAPI = String()
        var site_ID = String()
        var template_ID = String()
        var infoPlistDict = Bundle.main.infoDictionary
        site_ID = infoPlistDict!["sa_site_id"] as? String ?? ""
        template_ID = infoPlistDict!["sa_template_id"] as? String ?? ""
        
        kProductRatingAPI = "http://s28.socialannexstaging.com/mobileapi/avgreview/9775370/148"
        
        if site_ID.count > 0 && template_ID.count > 0 {
            if Connectivity.isConnectedToInternet {
                print("Connected 1")

                if Connectivity.isConnectedToInternet {
                    print("Connected 2")
                    
//                    var productIDDictionary = [AnyHashable: Any]()
//                    productIDDictionary["Product_id"] = globalArray
                    
                    let headers = [
                        "Content-Type": "application/x-www-form-urlencoded"
                    ]
                    let parameters = [
                        "Product_id": "472889P"
                    ]
                    
                    //URLEncoding.httpBody // JSONEncoding.default
                    
                    Alamofire.request("http://s28.socialannexstaging.com/mobileapi/avgreview/9775370/148", method: .post, parameters: parameters, encoding:  JSONEncoding.default, headers: headers).responseString { response in
                        switch(response.result) {
                        case.success(let data):
                            print("success",data)
                        case.failure(let error):
                            print("Not Success",error)
                        }
                    }
                }else {
                    var responseFailedDictionary = [
                        "failed" : "Please enter valid siteID/templateID"
                    ]
                    var err = NSError(domain: "Plist siteID/templateID Error", code: 500, userInfo: responseFailedDictionary)
                }
            }else {
                var responseFailedDictionary = [
                    "failed" : "Please enter valid siteID/templateID"
                ]
                var err = NSError(domain: "Plist siteID/templateID Error", code: 500, userInfo: responseFailedDictionary)
            }
            
        }else {
            var responseFailedDictionary = [
                "failed" : "Please enter valid siteID/templateID"
            ]
            var err = NSError(domain: "Plist siteID/templateID Error", code: 500, userInfo: responseFailedDictionary)
        }
    }
    
    @objc func loadMoreButtonClicked() {
//        class AnnexCloudRNRProvider {
//
//            class Singleton {
//                static let sharedInstance: AnnexCloudRNRProvider = {
//                    let instance = AnnexCloudRNRProvider()
//                    // setup code
//                    return instance
//                }()
//            }
//
//
//            public func getProductRating(fromProductList productIDListArray: [Any]?, parentVC parentController: UIViewController?, with handler: @escaping RNRResponseHandler) {
//                //        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%@",kProductRatingAPI,site_ID,template_ID]];
//                var responseDictionaryForProductRating: [AnyHashable: Any]? = nil
//                var kProductRatingAPI = String()
//                var site_ID = String()
//                var template_ID = String()
//                var infoPlistDict = Bundle.main.infoDictionary
//                site_ID = infoPlistDict!["sa_site_id"] as? String ?? ""
//                template_ID = infoPlistDict!["sa_template_id"] as? String ?? ""
//
//                kProductRatingAPI = "http://s28.socialannexstaging.com/mobileapi/avgreview"
//
//                if site_ID.count > 0 && template_ID.count > 0 {
//                    if Connectivity.isConnectedToInternet {
//                        print("Connected 1")
//
//                        var semaphore = DispatchSemaphore(value: 0)
//                        var error: Error?
//                        var configuration = URLSessionConfiguration.default
//                        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
//                        var session = URLSession(configuration: configuration, delegate: parentController as? URLSessionDelegate, delegateQueue: nil)
//                        var url = URL(string: "\(kProductRatingAPI)/\(site_ID)/\(template_ID)")
//                        var request: NSMutableURLRequest? = nil
//                        if let anUrl = url {
//                            request = NSMutableURLRequest(url: anUrl, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
//                        }
//                        request?.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//                        request?.httpMethod = "POST"
//                        var productIDDictionary = [AnyHashable: Any]()
//                        productIDDictionary["Product_id"] = productIDListArray
//                        var jsondata: Data? = try? JSONSerialization.data(withJSONObject: productIDDictionary, options: .prettyPrinted)
//                        request?.httpBody = jsondata
//
//                        if Connectivity.isConnectedToInternet {
//                            print("Connected 2")
//
//                            Alamofire.request("https://httpbin.org/get").response { response in
//                                print("Request: \(String(describing: response.request))")
//                                print("Response: \(String(describing: response.response))")
//                                print("Error: \(String(describing: response.error))")
//
//                                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                                    print("Data: \(utf8Text)")
//                                }
//                            }
//                        }else {
//                            var responseFailedDictionary = [
//                                "failed" : "Please enter valid siteID/templateID"
//                            ]
//                            var err = NSError(domain: "Plist siteID/templateID Error", code: 500, userInfo: responseFailedDictionary)
//                            handler(nil, err)
//                        }
//                    }else {
//                        var responseFailedDictionary = [
//                            "failed" : "Please enter valid siteID/templateID"
//                        ]
//                        var err = NSError(domain: "Plist siteID/templateID Error", code: 500, userInfo: responseFailedDictionary)
//                        handler(nil, err)
//                    }
//
//                }else {
//                    var responseFailedDictionary = [
//                        "failed" : "Please enter valid siteID/templateID"
//                    ]
//                    var err = NSError(domain: "Plist siteID/templateID Error", code: 500, userInfo: responseFailedDictionary)
//                    handler(nil, err)
//                }
//                /////////////////////////////////////
//
//
//
//
//                //                     session.dataTask(with: request, completionHandler: {(_ taskData: Data?, _ taskResponse: URLResponse?, _ taskError: Error?) -> Void in
//                //                        if (taskData?.count ?? 0) > 0 {
//                //                            var responseDictionary: [AnyHashable: Any]? = nil
//                //                            if let aData = taskData {
//                //                                responseDictionary = try? JSONSerialization.jsonObject(with: aData, options: []) as? [AnyHashable: Any]
//                //                            }
//                //                            var responseStatus = responseDictionary?["Status"] as? String
//                //                            //Response data successfully received
//                //                            if (responseStatus == "Success") {
//                //                                self.saveMobileApiFlag("avgreview")
//                //                                responseDictionaryForProductRating = responseDictionary
//                //                                handler(responseDictionaryForProductRating, nil)
//                //                            } else {
//                //                                //Response data failed to receive
//                //                                var failedMessageString = responseDictionary?["Message"] as? String
//                //                                if failedMessageString == NSNull() || failedMessageString.length() == 0 {
//                //                                    var responseFailedDictionary = [
//                //                                        kFailed : "Server Response Format Error"
//                //                                    ]
//                //                                    var err = NSError(domain: [], code: 500, userInfo: responseFailedDictionary)
//                //                                    handler(nil, err)
//                //                                } else {
//                //                                    var responseFailedDictionary = [
//                //                                        kFailed : failedMessageString
//                //                                    ]
//                //                                    var err = NSError(domain: [], code: 500, userInfo: responseFailedDictionary)
//                //                                    handler(nil, err)
//                //                                }
//                //                            }
//                //                        } else {
//                //                            var responseFailedDictionary = [
//                //                                kFailed : taskError.localizedDescription
//                //                            ]
//                //                            var err = NSError(domain: [], code: 500, userInfo: responseFailedDictionary)
//                //                            handler(nil, err)
//                //                        }
//                //                        dispatch_semaphore_signal(semaphore)
//                //                    }).resume()
//                //                    dispatch_semaphore_wait(semaphore,(DispatchTime.distantFuture))
//                //                }
//                //                else
//                //                {
//                //                    print("No Internet 2")
//                //                    var responseConnectionDictionary = [
//                //                        "connection" : "The internet connection appears to be offline"
//                //                    ]
//                //                    var err = NSError(domain:"The internet connection appears to be offline", code: 500, userInfo: responseConnectionDictionary)
//                //                    handler(nil, err)
//                //
//                //            }
//                //            }else {
//                //                print("No Internet 1")
//                //            }
//                //        } else {
//                //            var responseFailedDictionary = [
//                //                "failed" : "Please enter valid siteID/templateID"
//                //            ]
//                //            var err = NSError(domain: "Plist siteID/templateID Error", code: 500, userInfo: responseFailedDictionary)
//                //            handler(nil, err)
//                //        }
//            }
//
//            //    // MARK: - Annex Cloud
//            //    public func getProductRatingFromProductList(parentController:UIViewController){
//            //
//            //        print("called presentStoryboard vc = \(parentController)")
//            //        // Move to a background thread to main thread
//            //        DispatchQueue.main.async {
//            //            let bundle = Bundle(for: SeeAllMyReviewViewController.classForCoder())
//            //            let settingStoryboard : UIStoryboard = UIStoryboard(name: "SeeAllMyReview", bundle: bundle)
//            //            let settingVC = settingStoryboard.instantiateViewController(withIdentifier: "SeeAllMyReviewFramework") as! SeeAllMyReviewViewController
//            //            // Bounce back to the main thread to update the UI
//            //            DispatchQueue.main.async {
//            //                parentController.present(settingVC, animated: true, completion: nil)
//            //            }
//            //        }
//            //    }
//
//            struct Connectivity {
//                static let sharedInstance = NetworkReachabilityManager()!
//                static var isConnectedToInternet:Bool {
//                    return self.sharedInstance.isReachable
//                }
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Connectivity {
        static let sharedInstance = NetworkReachabilityManager()!
        static var isConnectedToInternet:Bool {
            return self.sharedInstance.isReachable
        }
    }
    
}
