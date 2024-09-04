//
//  HomeADController.swift
//  YannApplovinDemo
//
//  Created by YannMacMini on 2024/8/29.
//

import AppLovinSDK

class HomeADController : UIViewController, MARewardedAdDelegate {
   lazy var rewardedAd: MARewardedAd = MARewardedAd.shared(withAdUnitIdentifier: "ec2f350ef442e314")
    var retryAttempt = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.createRewardedAd()
        }

    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if rewardedAd.isReady {
              rewardedAd.show()
            }
        }

    func createRewardedAd() {

        rewardedAd.delegate = self

        // Load the first ad
        rewardedAd.load()
    }

    // MARK: MAAdDelegate Protocol

    func didLoad(_ ad: MAAd)
    {
        // Rewarded ad is ready to show. '[self.rewardedAd isReady]' now returns 'YES'.

        // Reset retry attempt
        retryAttempt = 0
    }

    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withError error: MAError)
    {
        // Rewarded ad failed to load
        // AppLovin recommends that you retry with exponentially higher delays up to a maximum delay (in this case 64 seconds).

        retryAttempt += 1
        let delaySec = pow(2.0, min(6.0, retryAttempt))

        DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
            self.rewardedAd.load()
        }
    }

    func didDisplay(_ ad: MAAd) {
        print(ad)
    }

    func didClick(_ ad: MAAd) {
        print(ad)
    }

    func didHide(_ ad: MAAd)
    {
        // Rewarded ad is hidden. Pre-load the next ad
        rewardedAd.load()
    }

    func didFail(toDisplay ad: MAAd, withError error: MAError) {
        print(error)
        // Rewarded ad failed to display. AppLovin recommends that you load the next ad.
        rewardedAd.load()
    }

    // MARK: MARewardedAdDelegate Protocol

    func didRewardUser(for ad: MAAd, with reward: MAReward)
    {
        print(ad)
        // Rewarded ad was displayed and user should receive the reward
    }
}
