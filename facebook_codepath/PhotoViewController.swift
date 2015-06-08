//
//  PhotoViewController.swift
//  facebook_codepath
//
//  Created by Jeff Smith on 6/7/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate  {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        var offset = Float(abs(scrollView.contentOffset.y))
        var alpha = CGFloat(1 - (offset * 1.25 / 100))
        self.view.alpha = alpha
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
    }
    

    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
        var offset = Float(abs(scrollView.contentOffset.y))
        if offset > 30 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
//    
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
//        // This method is called when the scrollview finally stops scrolling.
//    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
