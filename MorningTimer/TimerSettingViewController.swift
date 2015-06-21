//
//  ViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/17.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class TimerSettingViewController: UIViewController , UIToolbarDelegate ,UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    //textField: UITextField!
    var toolBar:UIToolbar!
    var myDatePicker: UIDatePicker!
    var myDatePicker2: UIDatePicker!
    var flag:Int=0  //テキストフィールドのflag
    var flag2:Int=0  //時間調整のflag
    
    
        //タップ認識
    @IBOutlet weak var Button1st:UIButton!
    

    var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //AppDelegateのインスタンスを取得
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate.message = "message" //appDelegateの変数を操作

        let Tap = UITapGestureRecognizer( target: self, action: "tapGesture:")

    // 入力欄の設定=======================================================
        textField.placeholder = changer(NSDate(),x:1)
        textField2.placeholder = textField.text
        
        textField.text        = changer(NSDate(),x:1)
        textField2.text = changer(NSDate(),x:2)//textField.text
        
        //Button1st.setTitle(dateToString(NSDate()), forState: UIControlState.Normal)

        //textField.sizeToFit()
        //self.view.addSubview(textField)
        //self.view.addSubview(Button1st)
        
        // UIDatePickerの設定
        myDatePicker = UIDatePicker()
        myDatePicker.addTarget(self, action: "changedDateEvent:", forControlEvents: UIControlEvents.ValueChanged)
        myDatePicker.datePickerMode = UIDatePickerMode.Time
        
        myDatePicker2 = UIDatePicker()
        myDatePicker2.addTarget(self, action: "changedDateEvent2:", forControlEvents: UIControlEvents.ValueChanged)
        myDatePicker2.datePickerMode = UIDatePickerMode.Time

        
        textField.inputView = myDatePicker
        textField2.inputView = myDatePicker2
        
        // UIToolBarの設定
        toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = .BlackTranslucent
        toolBar.tintColor = UIColor.whiteColor()
        toolBar.backgroundColor = UIColor.blackColor()
        
        let toolBarBtn      = UIBarButtonItem(title: "完了", style: .Bordered, target: self, action: "tappedToolBarBtn:")
        let toolBarBtnToday = UIBarButtonItem(title: "now", style: .Bordered, target: self, action: "tappedToolBarBtnToday:")
        
        toolBarBtn.tag = 1
        toolBar.items = [toolBarBtn, toolBarBtnToday]
        
        textField.inputAccessoryView = toolBar
        textField2.inputAccessoryView = toolBar
    }
    
     func tapGesture(sender: UITapGestureRecognizer){//背景タップでキーボード閉じる
       textField.resignFirstResponder()
       textField2.resignFirstResponder()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 「完了」を押すと閉じる
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
    }
    
    // 「now」を押すと今の時間をセットする
    func tappedToolBarBtnToday(sender: UIBarButtonItem) {
        if flag==1 {
            myDatePicker.date = NSDate()
            changeLabelDate(NSDate())
        }else if flag==2{
            myDatePicker2.date = NSDate()
            changeLabelDate2(NSDate())
        }
        
        
    }
    
    func changedDateEvent(sender:AnyObject?){
        flag=1;
        var dateSelecter: UIDatePicker = sender as! UIDatePicker
        self.changeLabelDate(myDatePicker.date)
        if flag2 != 2 {
            self.changeLabelDate2(myDatePicker.date)
        }
        
    }
    
    func changedDateEvent2(sender:AnyObject?){
        flag=2;
        flag2=2;
        var dateSelecter: UIDatePicker = sender as! UIDatePicker
        self.changeLabelDate2(myDatePicker2.date)
    }
    
    func changeLabelDate(date:NSDate) {
       //textField.text = self.dateToString(date)
        textField.text = changer(date,x:1)
    }
    
    func changeLabelDate2(date:NSDate) {
     //   textField2.text = self.dateToString(date)
        textField2.text = changer(date,x:2)
        
    }
    
  /* func dateToString(date:NSDate) ->String {
       /*let calender: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
    let comps: NSDateComponents = calender.components(NSCalendarUnit.YearCalendarUnit|NSCalendarUnit.MonthCalendarUnit|NSCalendarUnit.DayCalendarUnit|NSCalendarUnit.HourCalendarUnit|NSCalendarUnit.MinuteCalendarUnit|NSCalendarUnit.SecondCalendarUnit|NSCalendarUnit.WeekdayCalendarUnit, fromDate: date)*/
    
    //----------------------------------------------
    let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    
    //取得するコンポーネントを決める.
    let myComponetns = myCalendar.components(/*NSCalendarUnit.CalendarUnitYear   |
        NSCalendarUnit.CalendarUnitMonth  |
        NSCalendarUnit.CalendarUnitDay    |*/
        NSCalendarUnit.CalendarUnitHour   |
            NSCalendarUnit.CalendarUnitMinute |
            NSCalendarUnit.CalendarUnitSecond,
        fromDate: date)
    
    var hour:Int = myComponetns.hour
    var minute:Int = myComponetns.minute
    var second:Int = myComponetns.second
    //-----------------------------------------------
        var date_formatter: NSDateFormatter = NSDateFormatter()
      
        
        date_formatter.locale     = NSLocale(localeIdentifier: "ja")
        date_formatter.dateFormat="HH:mm"
        return date_formatter.stringFromDate(date)
    }*/


    func changer(date:NSDate,x:Int) ->String {
        let myCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        
        //取得するコンポーネントを決める.
        let myComponetns = myCalendar.components(/*NSCalendarUnit.CalendarUnitYear   |
            NSCalendarUnit.CalendarUnitMonth  |
            NSCalendarUnit.CalendarUnitDay    |*/
            NSCalendarUnit.CalendarUnitHour   |
                NSCalendarUnit.CalendarUnitMinute |
                NSCalendarUnit.CalendarUnitSecond,
            fromDate: date)
        
        var hour:Int = myComponetns.hour
        var minute:Int = myComponetns.minute
        var second:Int = myComponetns.second
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
        if x==1 {
            appDelegate.WakeUpTime[0]=hour
            appDelegate.WakeUpTime[1]=minute
            appDelegate.WakeUpTime[2]=second
        }else if x==2 {
            appDelegate.DepartureTime[0]=hour
            appDelegate.DepartureTime[1]=minute
            appDelegate.DepartureTime[2]=second
        }
//        println("x="+String(x))
//        for (var i=0;i<3;i++){
//            println("W:"+String(i)+"="+String(appDelegate.WakeUpTime[i]))
//        }
        
        appDelegate.time()
        
        return timeString
    }

}

