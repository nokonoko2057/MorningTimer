//
//  a.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/18.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class AlermViewController: UIViewController {

    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    var timer:NSTimer!
    

    @IBOutlet var TimeLabel2:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    func update(){
        TimeLabel2.text = appDelegate.time();
        
        if(appDelegate.hour==appDelegate.WakeUpTime[0]){
            if(appDelegate.minute==appDelegate.WakeUpTime[1]){
                appDelegate.flag=1
                timer.invalidate()
                self.dismissViewControllerAnimated(true, completion: nil)
                
            }
        }
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