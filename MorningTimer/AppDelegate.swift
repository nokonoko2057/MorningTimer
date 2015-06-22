//
//  AppDelegate.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/17.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var message:String?
    var test:Int=0

    var WakeUpTime:[Int]=[0,0,0]
    var DepartureTime:[Int]=[0,0,0]
    var RemainingTime:[Int]=[0,0,0]
    
    var NowTime:[Int]=[0,0,0]
    
    //var timer:NSTimer!
    var hour:Int = 0
    var minute:Int = 0
    var second:Int = 0

    var flag:Int=0
    
    
    func time() ->String{
        let myDate: NSDate = NSDate()
        //カレンダーを取得.
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        //取得するコンポーネントを決める.
        let myComponetns = myCalendar.components(/*NSCalendarUnit.CalendarUnitYear   |
            NSCalendarUnit.CalendarUnitMonth  |
            NSCalendarUnit.CalendarUnitDay    |*/
            NSCalendarUnit.CalendarUnitHour   |
                NSCalendarUnit.CalendarUnitMinute |
                NSCalendarUnit.CalendarUnitSecond,
            fromDate: myDate)
        
         hour = myComponetns.hour
         minute = myComponetns.minute
         second = myComponetns.second
        
        NowTime[0]=hour;
        NowTime[1]=minute;
        NowTime[2]=second;
        
        var timeString:String = ""
        if hour<10 {
            if minute<10{
                timeString="0"+String(hour)+":0"+String(minute);
            }else{
                timeString="0"+String(hour)+":"+String(minute);
            }
        }else{
            if minute<10{
                timeString=String(hour)+":0"+String(minute);
            }else{
                timeString=String(hour)+":"+String(minute);
            }
        }
        
        return timeString;

    }
    
    func countDown() ->String{
        
        
        for (var i=0;i<3;i++){
            RemainingTime[i]=DepartureTime[i]-NowTime[i];
        }
        
        if RemainingTime[2]<0 {
            RemainingTime[2]+=60;
            RemainingTime[1]-=1;
        }
        
        if RemainingTime[1]<0 {
            RemainingTime[1]+=60;
            RemainingTime[0]-=1;
        }
        
        var timeString:String = ""
        if RemainingTime[0]<10 {
            
            if RemainingTime[1]<10{
                if RemainingTime[2]<10{
                    timeString="0"+String(RemainingTime[0])+":0"+String(RemainingTime[1])+":0"+String(RemainingTime[2]);
                }else{
                    timeString="0"+String(RemainingTime[0])+":0"+String(RemainingTime[1])+":"+String(RemainingTime[2]);
                }
                
            }else{
                if RemainingTime[2]<10{
                    timeString="0"+String(RemainingTime[0])+":"+String(RemainingTime[1])+":0"+String(RemainingTime[2]);
                }else{
                    timeString="0"+String(RemainingTime[0])+":"+String(RemainingTime[1])+":"+String(RemainingTime[2]);
                }
            }
            
        }else{
            
            if RemainingTime[1]<10{
                if RemainingTime[2]<10{
                    timeString=String(RemainingTime[0])+":0"+String(RemainingTime[1])+":0"+String(RemainingTime[2]);
                }else{
                    timeString=String(RemainingTime[0])+":0"+String(RemainingTime[1])+":"+String(RemainingTime[2]);
                }

            }else{
                if RemainingTime[2]<10{
                    timeString=String(RemainingTime[0])+":"+String(RemainingTime[1])+":0"+String(RemainingTime[2]);
                }else{
                    timeString=String(RemainingTime[0])+":"+String(RemainingTime[1])+":"+String(RemainingTime[2]);
                }
            }
        }
        
        return timeString;

        
        
        
    }

    
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
//                    selector: Selector("time"),
//                    userInfo: nil,
//                    repeats: true)
        
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

