//
//  MLResourceUtils.m
//
//  Created by zhushuaishuai on 2017/11/23.
//

#import "___VARIABLE_MLResourceUtils___MLResourceUtils.h"

static NSString *___VARIABLE_MLResourceUtils___ML_Default_Localizable = @"ML_Localizable";


@implementation ___VARIABLE_MLResourceUtils___MLResourceUtils

+ (NSString * __nonnull)La:(NSString * __nonnull)key_
{
    NSBundle *bundle = [NSBundle mainBundle];
    return [self La:key_ bundle:bundle];
}

+ (NSString * __nonnull)La:(NSString * __nonnull)key_ bundle:(NSBundle*)bundle_
{
    NSString *value = [[self class] La:key_ bundle:bundle_ fromeTable:___VARIABLE_MLResourceUtils___ML_Default_Localizable];
    return value;
}

+ (NSString * __nonnull)La:(NSString * __nonnull)key_ bundle:(NSBundle * __nonnull)bundle_ fromeTable:(NSString *__nonnull)tbl_
{
    //当前系统设置的语言，值对应ios语言文件夹的值
    NSString *collatorId = [[NSLocale currentLocale] objectForKey: NSLocaleCollatorIdentifier];
    NSString *countryCode = [[NSLocale currentLocale] objectForKey: NSLocaleCountryCode];
    //去掉区域值
    NSString *lang = [collatorId stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"-%@",countryCode]]];

    NSString *path = [bundle_ pathForResource:lang ofType:@"lproj"];
    NSBundle *langBundle = [NSBundle bundleWithPath:path];
    //读取语言包失败，默认为英文
    if(!langBundle)
    {
        path = [bundle_ pathForResource:@"en" ofType:@"lproj"];
        langBundle = [NSBundle bundleWithPath:path];
    }
    NSString *tbl = [NSString stringWithFormat:@"%@",tbl_];
    NSString *value = [langBundle localizedStringForKey:key_ value:key_ table:tbl];
    return value;
}

+ (UIImage * __nullable)Im:(NSString * __nonnull)name_
{
    UIImage *image = [[self class] Im:name_ bundle:[NSBundle mainBundle]];
    return image;
}
+ (UIImage * __nullable)Im:(NSString * __nonnull)name_ bundle:(NSBundle *_Nonnull)bundle_
{
    UIImage *image = [UIImage imageNamed:name_ inBundle:bundle_ compatibleWithTraitCollection:nil];
    return image;
}

+ (UIStoryboard * __nullable)storyboard:(NSString * __nonnull)storyboardName_
{
    UIStoryboard *board = [[self class] storyboard:storyboardName_ bundle:[NSBundle mainBundle]];
    return board;
}
+ (UIStoryboard * __nullable)storyboard:(NSString * __nonnull)storyboardName_ bundle:(NSBundle *_Nonnull)bundle_
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:storyboardName_ bundle:bundle_];
    return board;
}
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_
{
    UIViewController *VC = [[self class] rootVC:storyboardName_ bundle:[NSBundle mainBundle]];
    return VC;
}
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ bundle:(NSBundle *_Nonnull)bundle_
{
    UIStoryboard *story = [[self class] storyboard:storyboardName_ bundle:bundle_];
    UIViewController *VC= story.instantiateInitialViewController;
    return VC;
}
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ identity:(NSString * __nonnull)identity_
{
    UIViewController *VC = [[self class] rootVC:storyboardName_ identity:identity_ bundle:[NSBundle mainBundle]];
    return VC;
}
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ identity:(NSString * __nonnull)identity_ bundle:(NSBundle *_Nonnull)bundle_
{
    UIStoryboard *story = [[self class] storyboard:storyboardName_ bundle:bundle_];
    UIViewController *VC = [story instantiateViewControllerWithIdentifier:identity_];
    return VC;
}


+ (___VARIABLE_MLResourceUtils___MLResourceUtils *_Nonnull)share___VARIABLE_MLResourceUtils___MLResourceUtils
{
    static ___VARIABLE_MLResourceUtils___MLResourceUtils *util;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        util = [[self alloc]init];
    });
    return util;
}

/**获取当前指向的NSBundle，如果未实现代理方法- (NSBundle *_Nonnull)customLoadBundle;则默认指向当前类所在NSBundle -zs*/
- (NSBundle *_Nullable)curBundle
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(customLoadBundle)]) {
        bundle = [self.delegate customLoadBundle];
    }
    return bundle;
}
/**获取当前指向的语言资源文件 如果未实现代理方法- (NSString *_Nonnull)customTableForLocalizedString; 则默认名为@“ML_Localizable”-zs*/
- (NSString *_Nonnull)curTableForLocalizedString
{
    NSString *localizedStr = ___VARIABLE_MLResourceUtils___ML_Default_Localizable;
    if (self.delegate && [self.delegate respondsToSelector:@selector(customTableForLocalizedString)]) {
        localizedStr = [self.delegate customTableForLocalizedString];
    }
    return localizedStr;
}
/**加载指向NSBundle下的指向的语言资源文件下的 对应语言描述 -zs*/
- (NSString * __nonnull)La:(NSString * __nonnull)key_
{
    NSString *la = [[self class] La:key_ bundle:[self curBundle] fromeTable:[self curTableForLocalizedString]];
    return la;
}
/**加载指向NSBundle下的 对应图片 -zs*/
- (UIImage * __nullable)Im:(NSString * __nonnull)name_
{
    UIImage *img = [[self class] Im:name_ bundle:[self curBundle]];
    return img;
}
/**加载指向NSBundle下的 对应UIStoryboard -zs*/
- (UIStoryboard * __nullable)storyboard:(NSString * __nonnull)storyboardName_
{
    UIStoryboard *story = [[self class] storyboard:storyboardName_ bundle:[self curBundle]];
    return story;
}
/**加载指向NSBundle下的 对应UIStoryboard的根UIViewController -zs*/
- (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_
{
    UIViewController *VC = [[self class] rootVC:storyboardName_ bundle:[self curBundle]];
    return VC;
}
/**加载指向NSBundle下的 对应UIStoryboard下对应UIViewController -zs*/
- (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ identity:(NSString * __nonnull)identity_
{
    UIViewController *VC = [[self class] rootVC:storyboardName_ identity:identity_ bundle:[self curBundle]];
    return VC;
}

@end
