//
//  AnnexCloudRNRProvider.swift
//  AnnexCloudRNR
//
//  Created by MacMini3 on 02/05/18.
//  Copyright © 2018 MacMini3. All rights reserved.
//
import Foundation

public class AnnexCloudRNRProvider {
    
    public init()
    {
        print("sachin hi hello")
    }
    
    // MARK: - Annex Cloud
    public func annexCloudSDK(parentController:UIViewController, arrayList:Array<Any>){
        
        print("called presentStoryboard vc = \(parentController)")
        // Move to a background thread to main thread
        DispatchQueue.main.async {
//            [0][1] // Program crash forcefully
            let bundle = Bundle(for: SeeAllMyReviewViewController.classForCoder())
            let settingStoryboard : UIStoryboard = UIStoryboard(name: "SeeAllMyReview", bundle: bundle)
            let settingVC = settingStoryboard.instantiateViewController(withIdentifier: "SeeAllMyReviewFramework") as! SeeAllMyReviewViewController
            let varab = SeeAllMyReviewViewController()
            varab.globalArray = arrayList as! [String]
            
            // Bounce back to the main thread to update the UI
            DispatchQueue.main.async {
                parentController.present(settingVC, animated: true, completion: nil)
            }
        }
    }
    
}
