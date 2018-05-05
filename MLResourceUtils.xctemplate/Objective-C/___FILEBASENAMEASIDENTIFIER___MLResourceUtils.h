//
//  MLResourceUtils.h
//
//  Created by zhushuaishuai on 2017/11/23.
//

#import <Foundation/Foundation.h>


/**快速加载主Bundle的ML_Localizable语言资源 -zs*/
#define ML_La(key_) [___VARIABLE_MLResourceUtils___MLResourceUtils La:key_]
/**快速加载主Bundle下的图片资源 -zs*/
#define ML_Im(name_) [___VARIABLE_MLResourceUtils___MLResourceUtils Im:name_]
/**快速加载主Bundle下的storyboard根控制器 -zs*/
#define ML_rootVC(storyboardName_) [___VARIABLE_MLResourceUtils___MLResourceUtils  rootVC:storyboardName_]

/**快速加载对象指定Bundle的 对象指定语言资源文件下的 多语言 -zs*/
#define ML_Inst_La(key_) [[___VARIABLE_MLResourceUtils___MLResourceUtils share___VARIABLE_MLResourceUtils___MLResourceUtils] La:key_]
/**快速加载对象指定Bundle下的图片资源 -zs*/
#define ML_Inst_Im(name_) [[___VARIABLE_MLResourceUtils___MLResourceUtils share___VARIABLE_MLResourceUtils___MLResourceUtils] Im:name_]
/**快速加载对象指定Bundle下的storyboard根控制器 -zs*/
#define ML_Inst_rootVC(storyboardName_) [[___VARIABLE_MLResourceUtils___MLResourceUtils share___VARIABLE_MLResourceUtils___MLResourceUtils]  rootVC:storyboardName_]


@protocol ___VARIABLE_MLResourceUtils___MLResourceProtocol <NSObject>
//自定义加载资源Bundle
- (NSBundle *_Nonnull)customLoadBundle;
//自定义语言资源名称
- (NSString *_Nonnull)customTableForLocalizedString;
@end

@interface ___VARIABLE_MLResourceUtils___MLResourceUtils : NSObject

+ (NSString * __nonnull)La:(NSString * __nonnull)key_;
+ (NSString * __nonnull)La:(NSString * __nonnull)key_ bundle:(NSBundle*_Nonnull)bundle_;
+ (NSString * __nonnull)La:(NSString * __nonnull)key_ bundle:(NSBundle * __nonnull)bundle_ fromeTable:(NSString *__nonnull)tbl_;
+ (UIImage * __nullable)Im:(NSString * __nonnull)name_;
+ (UIImage * __nullable)Im:(NSString * __nonnull)name_ bundle:(NSBundle *_Nonnull)bundle_;
+ (UIStoryboard * __nullable)storyboard:(NSString * __nonnull)storyboardName_;
+ (UIStoryboard * __nullable)storyboard:(NSString * __nonnull)storyboardName_ bundle:(NSBundle *_Nonnull)bundle_;
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_;
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ bundle:(NSBundle *_Nonnull)bundle_;
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ identity:(NSString * __nonnull)identity_;
+ (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ identity:(NSString * __nonnull)identity_ bundle:(NSBundle *_Nonnull)bundle_;

@property (nonatomic,weak,nullable) id <___VARIABLE_MLResourceUtils___MLResourceProtocol> delegate;
/**单例方法 -zs*/
+ (___VARIABLE_MLResourceUtils___MLResourceUtils *_Nonnull)share___VARIABLE_MLResourceUtils___MLResourceUtils;
/**获取当前指向的NSBundle，如果未实现代理方法- (NSBundle *_Nonnull)customLoadBundle;则默认指向当前类所在NSBundle -zs*/
- (NSBundle *_Nullable)curBundle;
/**获取当前指向的语言资源文件 如果未实现代理方法- (NSString *_Nonnull)customTableForLocalizedString; 则默认名为@“ML_Localizable”-zs*/
- (NSString *_Nonnull)curTableForLocalizedString;
/**加载指向NSBundle下的指向的语言资源文件下的 对应语言描述 -zs*/
- (NSString * __nonnull)La:(NSString * __nonnull)key_;
/**加载指向NSBundle下的 对应图片 -zs*/
- (UIImage * __nullable)Im:(NSString * __nonnull)name_;
/**加载指向NSBundle下的 对应UIStoryboard -zs*/
- (UIStoryboard * __nullable)storyboard:(NSString * __nonnull)storyboardName_;
/**加载指向NSBundle下的 对应UIStoryboard的根UIViewController -zs*/
- (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_;
/**加载指向NSBundle下的 对应UIStoryboard下对应UIViewController -zs*/
- (UIViewController * __nullable)rootVC:(NSString * __nonnull)storyboardName_ identity:(NSString * __nonnull)identity_;

@end
