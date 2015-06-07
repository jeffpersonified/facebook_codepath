//
//  ImageTransition.swift
//  facebook_codepath
//
//  Created by Jeff Smith on 6/7/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var feedViewController = fromViewController as! FeedViewController
        var photoViewController = toViewController as! PhotoViewController
        var destinationImageFrame = photoViewController.imageView.frame
        
        toViewController.view.alpha = 0
        photoViewController.imageView.frame = feedViewController.selectedImageView.frame
        
        UIView.animateWithDuration(duration, animations: {

            toViewController.view.alpha = 1
            photoViewController.imageView.frame = destinationImageFrame
            
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
}
