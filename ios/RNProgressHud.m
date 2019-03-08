//
//  RNProgressHud.m
//  ModuleExample
//
//  Created by Jonathan Rinciari on 3/6/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "ProgressHUD.h"


@interface RCT_EXTERN_MODULE(RNProgressHud, NSObject)
  RCT_EXTERN_METHOD(showSuccess: (NSString) message options: (NSDictionary *) options)
  RCT_EXTERN_METHOD(showError: (NSString) message options: (NSDictionary *) options)
  RCT_EXTERN_METHOD(showLoading: (NSString) message options: (NSDictionary *) options)
  RCT_EXTERN_METHOD(dismiss)
@end

