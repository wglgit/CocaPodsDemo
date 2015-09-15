//
//  sendViewController.swift
//  信条纸
//
//  Created by lq on 15/8/27.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//
import UIKit

class sendViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let vc:ViewController = ViewController();
        let vcw:ViewController = ViewController();
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        let mange:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        
        var emp :Employee?
        var dep :Department?
        emp = Employee(no: 43, name: "wgl", job: "ios", salary: 100000000)
        dep = Department(no: 001, name: "leqian")
        emp!.dep = dep;
        dep!.manage = emp;
        
        println(emp!.combinName)
        emp = nil;
        
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
class Department {
    var no:Int = 0;
    var name:String = ""
    var manage:Employee?
    init(no : Int , name : String) {
        self.no = no
        self.name = name
//        println("部门\(name)已经构建\n")

    }
    deinit{
//        println("部门\(name)已经析构\n")

    }
}
class Employee {
    var no :Int
    var name :String
    var job : String
    var salary :Double
    weak var dep :Department?
    init(no :Int,name :String,job : String,salary:Double){
        self.no = no
        self.name = name
        self.job = job
        self.salary = salary
        println("员工\(name)已经构建\n")
    }
    deinit{
        println("员工\(name)已经析构\n")
    }
    lazy var combinName : ()-> String = {
        [weak self] in
        return self!.name + "." + self!.job
    }
}
