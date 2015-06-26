//
//  FinishViewController.swift
//  MorningTimer
//
//  Created by yuki takei on 2015/06/26.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

    @IBAction func back(){
        //self.navigationController?.popToRootViewControllerAnimated(true)
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
