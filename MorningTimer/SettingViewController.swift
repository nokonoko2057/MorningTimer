//
//  SettingViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/28.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    var timer:NSTimer!

    @IBOutlet var Button1:UIButton!
    @IBOutlet var Button2:UIButton!
    @IBOutlet var Button3:UIButton!
    @IBOutlet var Button4:UIButton!
    @IBOutlet var Button5:UIButton!
    @IBOutlet var Button6:UIButton!
    @IBOutlet var Button7:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
            selector: Selector("update"),
            userInfo: nil,
            repeats: true)

    }
    
    func update(){
        var StringTime:String=""
        var StringTime1:String=""
        var StringTime2:String=""
        var tagFlag:Int=0
        if appDelegate.settingFlag == 1 {
            tagFlag = appDelegate.setWeekTag-1
            switch (appDelegate.setWeekTag) {
                case 1:
                    StringTime1 = StringChanger(appDelegate.setWeekTimer[tagFlag][0][0],minute: appDelegate.setWeekTimer[tagFlag][0][1])
                    StringTime2 = StringChanger(appDelegate.setWeekTimer[tagFlag][1][0],minute: appDelegate.setWeekTimer[tagFlag][1][1])
                    StringTime =  StringTime1+"→"+StringTime2;
                    Button1.setTitle(StringTime, forState: .Normal)
                    break;
                
                case 2 :
                    StringTime1 = StringChanger(appDelegate.setWeekTimer[tagFlag][0][0],minute: appDelegate.setWeekTimer[tagFlag][0][1])
                    StringTime2 = StringChanger(appDelegate.setWeekTimer[tagFlag][1][0],minute: appDelegate.setWeekTimer[tagFlag][1][1])
                    StringTime =  StringTime1+"→"+StringTime2;
                    Button2.setTitle(StringTime, forState: .Normal)
                    break;
                
                case 3 :
                    StringTime1 = StringChanger(appDelegate.setWeekTimer[tagFlag][0][0],minute: appDelegate.setWeekTimer[tagFlag][0][1])
                    StringTime2 = StringChanger(appDelegate.setWeekTimer[tagFlag][1][0],minute:appDelegate.setWeekTimer[tagFlag][1][1])
                    StringTime =  StringTime1+"→"+StringTime2;
                    Button3.setTitle(StringTime, forState: .Normal)
                    break;
                
                case 4 :
                    StringTime1 = StringChanger(appDelegate.setWeekTimer[tagFlag][0][0],minute: appDelegate.setWeekTimer[tagFlag][0][1])
                    StringTime2 = StringChanger(appDelegate.setWeekTimer[tagFlag][1][0],minute:appDelegate.setWeekTimer[tagFlag][1][1])
                    StringTime =  StringTime1+"→"+StringTime2;
                    Button4.setTitle(StringTime, forState: .Normal)
                    break;
                
                case 5 :
                    StringTime1 = StringChanger(appDelegate.setWeekTimer[tagFlag][0][0],minute: appDelegate.setWeekTimer[tagFlag][0][1])
                    StringTime2 = StringChanger(appDelegate.setWeekTimer[tagFlag][1][0],minute:appDelegate.setWeekTimer[tagFlag][1][1])
                    StringTime =  StringTime1+"→"+StringTime2;
                    Button5.setTitle(StringTime, forState: .Normal)
                    break;
                
                case 6 :
                    StringTime1 = StringChanger(appDelegate.setWeekTimer[tagFlag][0][0],minute: appDelegate.setWeekTimer[tagFlag][0][1])
                    StringTime2 = StringChanger(appDelegate.setWeekTimer[tagFlag][1][0],minute:appDelegate.setWeekTimer[tagFlag][1][1])
                    StringTime =  StringTime1+"→"+StringTime2;
                    Button6.setTitle(StringTime, forState: .Normal)
                    break;
                
                case 7 :
                    StringTime1 = StringChanger(appDelegate.setWeekTimer[tagFlag][0][0],minute: appDelegate.setWeekTimer[tagFlag][0][1])
                    StringTime2 = StringChanger(appDelegate.setWeekTimer[tagFlag][1][0],minute:appDelegate.setWeekTimer[tagFlag][1][1])
                    StringTime =  StringTime1+"→"+StringTime2;
                    Button7.setTitle(StringTime, forState: .Normal)
                    break;
                
                default:
                    break;
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPush(sender: AnyObject){
        appDelegate.setWeekTag = sender.tag
        let weekSettingViewController: WeekSettingViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WeekSettingVC") as! WeekSettingViewController
        // アニメーションを設定する.
        //secondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        // 値渡ししたい時 hoge -> piyo
        //secondViewController.piyo = self.hoge
        // Viewの移動する.
        self.presentViewController(weekSettingViewController, animated: true, completion: nil)

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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
