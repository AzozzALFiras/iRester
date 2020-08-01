#import <notify.h>
#import <Social/Social.h>
#import <prefs.h>
#import <Cephei/HBPreferences.h>


@interface UIColor ()
+ (id)labelColor;
@end

// thanks for julioverne
// this file setting by julioverne;
// https://github.com/julioverne

#define PLIST_PATH_Settings "/var/mobile/Library/Preferences/co.azozzalfiras.irester.plist"

@interface iRestersRootListController : PSListController {
UILabel* _label;
UILabel* underLabel;
}
@end

@implementation iRestersRootListController
- (id)specifiers {
if (!_specifiers) {
NSMutableArray* specifiers = [NSMutableArray array];
PSSpecifier* spec;


spec = [PSSpecifier emptyGroupSpecifier];
[spec setProperty:@"You can reset the tweaks whose settings are inside the Settings" forKey:@"footerText"];
[specifiers addObject:spec];

spec = [PSSpecifier preferenceSpecifierNamed:@"Rest"
target:self
set:Nil
get:Nil
detail:Nil
cell:PSGroupCell
edit:Nil];
[spec setProperty:@"Rest" forKey:@"label"];
[specifiers addObject:spec];
spec = [PSSpecifier preferenceSpecifierNamed:@"Rest"
target:self
set:NULL
get:NULL
detail:Nil
cell:PSLinkCell
edit:Nil];
spec->action = @selector(iRester);
[specifiers addObject:spec];
spec = [PSSpecifier emptyGroupSpecifier];
[spec setProperty:@"iRester © 2020 Azozz ALFiras" forKey:@"footerText"];
[specifiers addObject:spec];
_specifiers = [specifiers copy];
}
return _specifiers;
}

-(void)iRester {

UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"iRester"
message: @"enter Package id"
preferredStyle:UIAlertControllerStyleAlert];

[alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
textField.placeholder = @"co.azozzalfiras.*";
@try {
textField.textColor = [UIColor labelColor];
}@catch(NSException*e){
}
textField.clearButtonMode = UITextFieldViewModeWhileEditing;

}];

[alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

}]];

[alertController addAction:[UIAlertAction actionWithTitle:@"Reset" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
NSArray * textfields = alertController.textFields;
UITextField * namefield = textfields[0];
NSString *Isss = namefield.text;
if(Isss){
  HBPreferences *AFSettings = [[HBPreferences alloc] initWithIdentifier:Isss];
  [AFSettings removeAllObjects];

UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"iRester"
message:@"Reset successful"
delegate:nil
cancelButtonTitle:@"Thx"
otherButtonTitles:nil];
[alert show];
}

}]];
[self presentViewController:alertController animated:YES completion:nil];





}

- (void)twitter{
UIApplication *app = [UIApplication sharedApplication];
if ([app canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=AzozzALFiras"]]) {
[app openURL:[NSURL URLWithString:@"twitter://user?screen_name=AzozzALFiras"]];
} else if ([app canOpenURL:[NSURL URLWithString:@"tweetbot:///user_profile/AzozzALFiras"]]) {
[app openURL:[NSURL URLWithString:@"tweetbot:///user_profile/AzozzALFiras"]];
} else {
[app openURL:[NSURL URLWithString:@"https://mobile.twitter.com/AzozzALFiras"]];
}
}


- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier
{
@autoreleasepool {
NSMutableDictionary *CydiaEnablePrefsCheck = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH_Settings]?:[NSMutableDictionary dictionary];
[CydiaEnablePrefsCheck setObject:value forKey:[specifier identifier]];
[CydiaEnablePrefsCheck writeToFile:@PLIST_PATH_Settings atomically:YES];
notify_post("co.azozzalfiras.irester/Settings");
}
}
- (id)readPreferenceValue:(PSSpecifier*)specifier
{
@autoreleasepool {
NSDictionary *CydiaEnablePrefsCheck = [[NSDictionary alloc] initWithContentsOfFile:@PLIST_PATH_Settings];
return CydiaEnablePrefsCheck[[specifier identifier]]?:[[specifier properties] objectForKey:@"default"];
}
}


- (void) loadView
{
[super loadView];
self.title = @"iRester";
[UISwitch appearanceWhenContainedIn:self.class, nil].onTintColor = [UIColor colorWithRed:0.09 green:0.99 blue:0.99 alpha:1.0];

}
- (void)increaseAlpha
{
[UIView animateWithDuration:0.5 animations:^{
_label.alpha = 1;
}completion:^(BOOL finished) {
[UIView animateWithDuration:0.5 animations:^{
underLabel.alpha = 1;
}completion:nil];
}];
}
@end
