//
//  FeedViewController.swift
//  facebook_codepath
//
//  Created by Jeff Smith on 5/31/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {


    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var wedding1: UIImageView!
    @IBOutlet weak var wedding2: UIImageView!
    @IBOutlet weak var wedding3: UIImageView!
    @IBOutlet weak var wedding4: UIImageView!
    @IBOutlet weak var wedding5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
        feedScrollView.contentSize = CGSize(width: feedImageView.frame.width, height: feedImageView.frame.height + 64)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didTapWedding1(sender: UITapGestureRecognizer) {
        println("1")
    }

    @IBAction func didTapWedding2(sender: UITapGestureRecognizer) {
        println("2")
    }
    @IBAction func didTapWedding3(sender: UITapGestureRecognizer) {
        println("3")
    }

    @IBAction func didTapWedding4(sender: AnyObject) {
        println("4")
    }

    @IBAction func didTapWedding5(sender: AnyObject) {
        println("5")
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
