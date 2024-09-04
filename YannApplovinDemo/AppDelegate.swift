//
//  AppDelegate.swift
//  YannApplovinDemo
//
//  Created by YannMacMini on 2024/8/29.
//

import UIKit
import AppLovinSDK


@main



class AppDelegate: UIResponder, UIApplicationDelegate  {

    
    
    
    private lazy var appOpenAd = MAAppOpenAd(adUnitIdentifier: "8ce369f2698ba225")
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        ALPrivacySettings.setHasUserConsent(true)
        
        // 1.Create the initialization configuration
        let initConfig = ALSdkInitializationConfiguration(sdkKey: "AqJzLbUHHAd4uENDQA_OHv326u9b1T6O8rJldXeVZm0Rb0SOg7XLZTLNCqvRhcDiOJ9pvllMHcbiRADfGJo4gQ") { builder in
            
            builder.mediationProvider = ALMediationProviderMAX
            
            // Perform any additional configuration/setting changesprint(error)
        }
        
        
        //        AppLovinSdkSettings.termsAndPrivacyPolicyFlowSettings.debugUserGeography = .GDPR
        // Configure the SDK settings if needed before or after SDK initialization.
        let settings = ALSdk.shared().settings
        settings.initializationAdUnitIdentifiers = ["ec2f350ef442e314","8ce369f2698ba225"]
        // Note: you may also set these values in your Info.plist
        settings.termsAndPrivacyPolicyFlowSettings.isEnabled = true
        settings.termsAndPrivacyPolicyFlowSettings.termsOfServiceURL = URL(string: "https://www.baidu.com")
        settings.termsAndPrivacyPolicyFlowSettings.privacyPolicyURL = URL(string: "https://www.baidu.com")
        
        // 2.Initialize the SDK with the configuration
        ALSdk.shared().initialize(with: initConfig) {[weak self] sdkConfig in
            guard let self = self else { return}
            // Start loading ads
            appOpenAd.delegate = self
            appOpenAd.load()
        }
        
        ALSdk.shared().settings.isVerboseLoggingEnabled = true
        return true
    }
  
    func applicationDidBecomeActive(_ application: UIApplication)
    {
      showAdIfReady()
    }

    private func showAdIfReady()
    {
      if ALSdk.shared().isInitialized
      {
        return
      }

      if appOpenAd.isReady
      {
        appOpenAd.show(forPlacement: "«test-placement-ID»")
      }
      else
      {
        appOpenAd.load()
      }
    }
    
    
}


extension AppDelegate: MAAdDelegate {
    func didLoad(_ ad: MAAd) {
        print(ad)
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError) {
        print(error)
    }
    
    func didDisplay(_ ad: MAAd) {
        print(ad)
    }
    
    func didHide(_ ad: MAAd) {
        print(ad)
    }
    
    func didClick(_ ad: MAAd) {
        print(ad)
    }
    
    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        print(error)

    }
    
}



// -----------------------------------------
/*
class AppDelegate: UIResponder, UIApplicationDelegate  {
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ALSdk.initializeSdk()
//
    return true
}
}
*/
