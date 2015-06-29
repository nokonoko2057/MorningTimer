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
        var i:Int=0;

        // Do any additional setup after loading the view.
        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
            selector: Selector("update"),
            userInfo: nil,
            repeats: true)
        
        appDelegate.dataImport()
        appDelegate.setWeekTag = 1;
         var ButtonText:String = ""
        for (i=1;i<8;i++){
           
            ButtonText = appDelegate.chageButtonText()
            switch (i) {
            case 1:
                Button1.setTitle(ButtonText, forState: .Normal)
                break;
            case 2:
                Button2.setTitle(ButtonText, forState: .Normal)
                break;
            case 3:
                Button3.setTitle(ButtonText, forState: .Normal)
                break;
            case 4:
                Button4.setTitle(ButtonText, forState: .Normal)
                break;
            case 5:
                Button5.setTitle(ButtonText, forState: .Normal)
                break;
            case 6:
                Button6.setTitle(ButtonText, forState: .Normal)
                break;
            case 7:
                Button7.setTitle(ButtonText, forState: .Normal)
                break;
            default:
                break;
                
            }
            appDelegate.setWeekTag += 1;
        }
        
        
    }
    
    func update(){
//        var StringTime:String=""
//        var StringTime1:String=""
//        var StringTime2:String=""
//        var tagFlag:Int=0
        var ButtonText:String = ""
        if appDelegate.settingFlag == 1 {
            ButtonText = appDelegate.chageButtonText()
            switch (appDelegate.setWeekTag) {
            case 1:
                Button1.setTitle(ButtonText, forState: .Normal)
                break;
            case 2:
                Button2.setTitle(ButtonText, forState: .Normal)
                break;
            case 3:
                Button3.setTitle(ButtonText, forState: .Normal)
                break;
            case 4:
                Button4.setTitle(ButtonText, forState: .Normal)
                break;
            case 5:
                Button5.setTitle(ButtonText, forState: .Normal)
                break;
            case 6:
                Button6.setTitle(ButtonText, forState: .Normal)
                break;
            case 7:
                Button7.setTitle(ButtonText, forState: .Normal)
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

    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
