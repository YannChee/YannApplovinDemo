//
//  AppDelegate.swift
//  YannApplovinDemo
//
//  Created by YannMacMini on 2024/8/29.
//

import UIKit
import AppLovinSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 1.Create the initialization configuration
        let initConfig = ALSdkInitializationConfiguration(sdkKey: "AqJzLbUHHAd4uENDQA_OHv326u9b1T6O8rJldXeVZm0Rb0SOg7XLZTLNCqvRhcDiOJ9pvllMHcbiRADfGJo4gQ") { builder in

          builder.mediationProvider = ALMediationProviderMAX

          // Perform any additional configuration/setting changes
        }
        
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

