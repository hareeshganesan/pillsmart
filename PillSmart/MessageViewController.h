//
//  MessageViewController.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 1/11/14.
//  Copyright (c) 2014 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController
{
    IBOutlet UITextField *username;
    IBOutlet UIButton *sendButton;
    IBOutlet UIButton *receiveButton;
    IBOutlet UITextView *messageView;
    IBOutlet UITextField *messageToSend;
}

- (IBAction)sendMessage:(id)sender;
- (IBAction)refreshMessages:(id)sender;


@end
