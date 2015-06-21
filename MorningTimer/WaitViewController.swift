//
//  WaitViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/21.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class WaitViewController: UIViewController {

    @IBOutlet weak var TimeLabel: UILabel!
    var timer:NSTimer!
    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TimeLabel.text = dateToString(NSDate())
        // Do any additional setup after loading the view.
        
        timer=NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,
            selector: Selector("update"),
            userInfo: nil,
           repeats: true)

    }

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


//    func dateToString(date:NSDate) ->String {
//        
//        var date_formatter: NSDateFormatter = NSDateFormatter()
//        
//        
//        date_formatter.locale     = NSLocale(localeIdentifier: "ja")
//        date_formatter.dateFormat="HH:mm"
//        return date_formatter.stringFromDate(date)
//    }
    
    func update(){
        TimeLabel.text = appDelegate.time();
        
        if(appDelegate.hour==appDelegate.WakeUpTime[0]){
            if(appDelegate.minute==appDelegate.WakeUpTime[1]){
                appDelegate.flag=1
                timer.invalidate()
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }
        }
//        var hour = appDelegate.hour
//        var minute = appDelegate.minute
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
