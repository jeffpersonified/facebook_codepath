//
//  ImageTransition.swift
//  facebook_codepath
//
//  Created by Jeff Smith on 6/7/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {

    var window = UIApplication.sharedApplication().keyWindow

    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        var duplicateImage: UIImageView!
        var feedViewController = fromViewController as! FeedViewController
        var photoViewController = toViewController as! PhotoViewController
        var destinationImageFrame = photoViewController.imageView.frame
        var adjustedFrame = window!.convertRect(feedViewController.selectedImageView.frame, fromView: feedViewController.feedScrollView)
        
        duplicateImage = feedViewController.selectedImageView
        duplicateImage.frame = adjustedFrame
        duplicateImage.contentMode = UIViewContentMode.ScaleAspectFit
        duplicateImage.clipsToBounds = true
        window!.addSubview(duplicateImage)
        
        photoViewController.imageView.alpha = 0
        toViewController.view.alpha = 0

        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            duplicateImage.frame = destinationImageFrame
            duplicateImage.alpha = 1
        }) { (finished: Bool) -> Void in
            duplicateImage.alpha = 0
            photoViewController.imageView.alpha = 1
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        var duplicateImage: UIImageView!
        var photoViewController = fromViewController as! PhotoViewController
        var feedViewController = toViewController as! FeedViewController
        var destinationImageFrame = feedViewController.selectedImageView.frame
        var adjustedFrame = window!.convertRect(photoViewController.imageView.frame, fromView: photoViewController.scrollView)
        
        duplicateImage = photoViewController.imageView
        duplicateImage.frame = adjustedFrame
        duplicateImage.clipsToBounds = true
        window!.addSubview(duplicateImage)
        
        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            duplicateImage.frame = destinationImageFrame
            duplicateImage.alpha = 0
        }) { (finished: Bool) -> Void in
            duplicateImage.alpha = 0
            self.finish()
        }
    }
}
