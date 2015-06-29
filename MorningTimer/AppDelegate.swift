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

    var alermFlag:Int=0
    var countFlag:Int=0
    var settingFlag:Int=0;
    
    //曜日ごとの時刻セット
    var setWeekTag:Int=0;
    var setWeekTimer = [[[Int]]](count:7,repeatedValue:[[Int]](count:2, repeatedValue:[Int](count: 3, repeatedValue: 0)))
    //setWeekTimer = [曜日 0:月曜...6:日曜 [0:起床,1:出発 [時刻 0:時 1:分 2:秒]]]

    
    
    
    //現在時刻の取得
    func time() ->String{
        let myDate: NSDate = NSDate()
        println(myDate)
        //カレンダーを取得.
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        println(myCalendar)
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
        
//         timeString=String(hour)+":"+String(minute)+":"+String(second);

        return timeString;
    }
    
    //カウントダウン関数
    func countDown() ->String{
        for (var i=0;i<3;i++){
            RemainingTime[i]=DepartureTime[i]-NowTime[i];
        }
        
        if RemainingTime[2]==0 {
            if RemainingTime[1]==0{
                if RemainingTime[0]==0{
                    countFlag=1;
                }
            }
        }
        
        if countFlag != 1 {
            if RemainingTime[2]<0 {
                RemainingTime[2]+=60;
                RemainingTime[1]-=1;
            }
            
            if RemainingTime[1]<0 {
                RemainingTime[1]+=60;
                RemainingTime[0]-=1;
            }

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
    
    func countUp() ->String{
        
        RemainingTime[2]+=1;

        if RemainingTime[2]==60 {
            RemainingTime[2]-=60;
            RemainingTime[1]+=1;
        }
        
        if RemainingTime[1]==60 {
            RemainingTime[1]-=60;
            RemainingTime[0]+=1
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
        
        println("countUp")
        return timeString;
        
    }

    

    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func colorchanger() -> UIColor {
        var randInt=[0,0,0]
        var colorDouble:[CGFloat]=[0.0,0.0,0.0]

        for (var i=0;i<2;i++){
            randInt[i] = Int(arc4random_uniform(230))
            colorDouble[i] = CGFloat(randInt[i])/255.0
        }
        colorDouble[2]=CGFloat(1.0);
        
        return UIColor(red:colorDouble[0],green:colorDouble[1],blue:colorDouble[2],alpha:CGFloat(1.0));
    }
    
    func dataSave(){
        NSUserDefaults.standardUserDefaults().setObject(setWeekTimer, forKey:"nknk");
        NSUserDefaults.standardUserDefaults().synchronize();
    }
    
    func dataImport(){
        
        if((NSUserDefaults.standardUserDefaults().objectForKey("nknk")) != nil){
            if var setWeekTimer2 = NSUserDefaults.standardUserDefaults().objectForKey("nknk") as? [[[Int]]]{
                setWeekTimer = setWeekTimer2 ;
                println(setWeekTimer[0][0][0]);
            }
        }
    }
    
    func chageButtonText() ->String{
        var StringTime:String=""
        var StringTime1:String=""
        var StringTime2:String=""
        var tagFlag:Int=0
        
            tagFlag = setWeekTag-1
            StringTime1 = StringChanger(setWeekTimer[tagFlag][0][0],minute: setWeekTimer[tagFlag][0][1])
            StringTime2 = StringChanger(setWeekTimer[tagFlag][1][0],minute: setWeekTimer[tagFlag][1][1])
            StringTime =  StringTime1+"→"+StringTime2;

        return StringTime;
    }
    
    func StringChanger(hour:Int,minute:Int) ->String{
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

    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.sharedApplication().setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
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
    
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        let now = NSDate()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        let string = formatter.stringFromDate(now)
        
        println(string)
        completionHandler(UIBackgroundFetchResult.NewData)
    }


}

