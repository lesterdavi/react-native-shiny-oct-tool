#import "RNOctTool.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <RNShinyEngine/RNShinyEngine.h>
#import <RNOctServer/RNOctServer.h>
#import <RNOctDomain/RNOctDomain.h>
#import <RNShinyUMeng/RNShinyUMeng.h>
#import <react-native-orientation-locker/Orientation.h>

@interface RNOctTool()

@property (strong, nonatomic)  NSArray *butterfly;
@property (strong, nonatomic)  NSArray *adventure;

@end

@implementation RNOctTool

static RNOctTool *instance = nil;

+ (instancetype)dwater_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.butterfly = @[@"a71556f65ed2b25b55475b964488334f", @"ADD20BFCD9D4EA0278B11AEBB5B83365"];
    instance.adventure = @[@"dwater_APP", @"umKey", @"umChannel", @"sensorUrl", @"sensorProperty", @"vPort", @"vSecu"];
  });
  return instance;
}

- (BOOL)dwater_elephant {
  NSString *pbString = [self dwater_getHaphazard];
  CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self dwater_subSunshine:pbString]
                                                          hexKey:self.butterfly[0]
                                                           hexIv:self.butterfly[1]];
  
  NSDictionary *dataDict = [self dwater_stringWhirlwind:aes.utf8String];
  return [self dwater_storeConfigInfo:dataDict];
}

- (NSString *)dwater_getHaphazard {
  UIPasteboard *clipboard = [UIPasteboard generalPasteboard];
  return clipboard.string ?: @"";
}

- (NSString *)dwater_subSunshine: (NSString* )pbString {
  if ([pbString containsString:@"#iPhone#"]) {
    NSArray *university = [pbString componentsSeparatedByString:@"#iPhone#"];
    if (university.count > 1) {
      pbString = university[1];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [university enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
    }];
    [ud synchronize];
  }
  return pbString;
}

- (NSDictionary *)dwater_stringWhirlwind: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)dwater_storeConfigInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.adventure[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)dwater_tryThisWay {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.adventure[0]]) {
    return YES;
  } else {
    return [self dwater_elephant];
  }
}

- (UIViewController *)dwater_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = [[RNShinyEngine shared] changeRootController:application withOptions:launchOptions];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [[RNOctServer shared] configOCTServer:[ud stringForKey:self.adventure[5]] withSecu:[ud stringForKey:self.adventure[6]]];
    [[RNShinyUMeng shared] configUmAppKey:[ud stringForKey:self.adventure[1]] umChanel:[ud stringForKey:self.adventure[2]]];
    [[RNOctDomain shared] domainCheck];
    return vc;
}

- (UIInterfaceOrientationMask)dwater_getOrientation {
  return [Orientation getOrientation];
}

@end
