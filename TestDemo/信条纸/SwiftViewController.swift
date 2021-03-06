//
//  SwiftViewController.swift
//  信条纸
//
//  Created by lq on 15/8/24.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

import UIKit


class SwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var uStr:String = UIDevice.currentDevice().systemVersion as String
        let verson = (uStr as NSString).floatValue
        print("\(verson)\n")
        var testBtn:UIButton = UIButton.buttonWithType(UIButtonType.ContactAdd) as! UIButton
        testBtn.frame = CGRectMake(100, 100, 30, 30);
        testBtn.addTarget(self, action:Selector("btnAcion:"), forControlEvents: UIControlEvents.TouchUpInside)
        var palyer = Player(name:"www")
        self.view.addSubview(testBtn)
        palyer.completeLevel(2)
        print("the player the highest level is \(LevelTracker.highestUnlockLevel)")
        self.view.backgroundColor = UIColor.greenColor();
        let version:String = NSBundle.mainBundle().infoDictionary!["CFBundleInfoDictionaryVersion"] as! String
        print(version)
//        let version:String = NSBundle.mainBundle().infoDictionary[CFBundlein]
        
        
        // Do any additional setup after loading the view.
    }
    func btnAcion(btn:UIButton){
        let sv:sendViewController = sendViewController()
        self.presentViewController(sv, animated:true, completion: nil)
    }
    struct LevelTracker {
        static var highestUnlockLevel = 1;
        static func levelUnlocked(level:Int){
            if level > highestUnlockLevel{highestUnlockLevel = level}
        }
        var currentLevel  = 1;
        static func levelIsUnlocked(level:Int)->Bool{
            return level <= highestUnlockLevel;
        }
        mutating func addvacnToLevel(level:Int)->Bool{
            if LevelTracker.levelIsUnlocked(level){
                currentLevel = level
                return true
            }else
            {
                return false
            }

        }
    }
    class Player {
        var tracker = LevelTracker();
        var playName:String
        init(name:String){
            playName = name
        }
        func completeLevel(level:Int){
            LevelTracker.levelUnlocked(level + 1)
            tracker.addvacnToLevel(level + 1)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
