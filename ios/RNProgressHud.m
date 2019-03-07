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

  RCT_EXTERN_METHOD(showSuccess: (NSString) message)
  RCT_EXTERN_METHOD(showError: (NSString) message)
  RCT_EXTERN_METHOD(showLoading)
  RCT_EXTERN_METHOD(setOptions: (NSDictionary *) data hudType: (NSString) type)

@end

