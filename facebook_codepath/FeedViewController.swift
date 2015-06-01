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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.83, green: 0.84, blue: 0.86, alpha: 1)
        feedScrollView.contentSize = CGSize(width: feedImageView.frame.width, height: feedImageView.frame.height + 64)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
