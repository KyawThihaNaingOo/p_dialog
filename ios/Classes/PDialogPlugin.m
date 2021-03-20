#import "PDialogPlugin.h"
#if __has_include(<p_dialog/p_dialog-Swift.h>)
#import <p_dialog/p_dialog-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "p_dialog-Swift.h"
#endif

@implementation PDialogPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPDialogPlugin registerWithRegistrar:registrar];
}
@end
