Vim�UnDo� �Sy�v����p�����1��m�YEV2�ٵ�c  2   				        .   4          4   4    R�Cr    _�       /           .         ����                                                                                                                                                                                                                                                                                                                            �           �           V        R�1G    �       4      u		UINavigationController *navigationController = [UIStoryboard.pl_peopleStoryboard instantiateInitialViewController];5�_�   .   0           /           ����                                                                                                                                                                                                                                                                                                                            �           �           V        R�2�     �              4   //   //  PLAppDelegate.m   //  Potluck   //   +//  Created by Alexsander Akers on 8/21/13.   >//  Copyright (c) 2013 Branch Media, Inc. All rights reserved.   //       @import CoreTelephony;   ##import <Crashlytics/Crashlytics.h>   #import <FlurrySDK/Flurry.h>   ##import <FacebookSDK/FacebookSDK.h>   #import <HockeySDK/HockeySDK.h>   0#import <SBRXCallbackURLKit/SBRCallbackParser.h>   #import <Parse/Parse.h>   #import "NSData+PLHexString.h"   &#import "NSUserDefaults+PLAdditions.h"   #import "PLAPIClient.h"   #import "PLAppDelegate.h"   "#import "PLNavigationController.h"   #import "PLPageControl.h"    #import "PLRoomViewController.h"   "#import "PLPeopleViewController.h"   #import "PLWindow.h"   $#import "UIStoryboard+PLAdditions.h"       Ystatic NSString *const PLCrashlyticsAPIKey = @"b8be8ed0f1568fff58195ebe456ffe7fb738e243";   @static NSString *const PLFlurryAPIKey = @"9CP6WBXNJDYSVH3HZ8ZR";   Pstatic NSString *const PLHockeyIdentifier = @"ca1c3d07c7a6d92f864999bbb97770c3";   Zstatic NSString *const PLParseApplicationID = @"QxPWNKXcljAipw52aFWcejj5Crubt93C0kOJBemF";   Vstatic NSString *const PLParseClientKey = @"pBfpfKESa5A3GNftH9ntIoOZ4J0IwYyibBQC6B50";   Tstatic NSString *const PLPeopleNavigationStoryboardIdentifier = @"PeopleNavigation";   2static NSString *const PLURLScheme = @"x-potluck";       [NSString *const PLAppDelegateDidLogOutNotification = @"PLAppDelegateDidLogOutNotification";       @implementation PLAppDelegate       1- (void)handleMagicalRecordError:(NSError *)error   {   	NSLog(@"%@", error);   }   - (void)performLogOut   {   2	NSFileManager *fm = [[NSFileManager alloc] init];   	   s	NSURL *appSupportURL = [fm URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask].firstObject;   	   b	NSString *bundleName = NSBundle.mainBundle.infoDictionary[(__bridge NSString *)kCFBundleNameKey];   f	NSURL *potluckAppSupportURL = [appSupportURL URLByAppendingPathComponent:bundleName isDirectory:YES];   6	[fm removeItemAtURL:potluckAppSupportURL error:NULL];   	   	[MagicalRecord cleanUp];   	   C	NSString *bundleIdentifier = NSBundle.mainBundle.bundleIdentifier;   c	NSURL *cachesURL = [fm URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].firstObject;   c	NSURL *potluckCacheURL = [cachesURL URLByAppendingPathComponent:bundleIdentifier isDirectory:YES];   1	[fm removeItemAtURL:potluckCacheURL error:NULL];   	   <	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];   R	[[ud persistentDomainForName:bundleIdentifier] bk_each:^(NSString *key, id obj) {   �		if ([key hasPrefix:@"PL"] && ![key isEqualToString:PLHasSeenOnboardingKey] && ![key isEqualToString:PLHasHeartedRoomKey] && ![key isEqualToString:PLHasSeenTwitterAuthPromptKey] ) {   			[ud removeObjectForKey:key];   		}   	}];   	[ud synchronize];   	   O	[PLAPIClient.sharedClient.tasks makeObjectsPerformSelector:@selector(cancel)];   	   1	[MagicalRecord setupAutoMigratingCoreDataStack];   	   l	[[NSNotificationCenter defaultCenter] postNotificationName:PLAppDelegateDidLogOutNotification object:self];   	   @	UIApplication.sharedApplication.applicationIconBadgeNumber = 0;   }   - (void)logOut   {   5	[PLAPIClient.sharedClient resetAuthenticationToken];   	[self performLogOut];   }   $- (void)registerForPushNotifications   {   �	[UIApplication.sharedApplication registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert];   }   &- (void)unregisterForPushNotifications   {   D	[UIApplication.sharedApplication unregisterForRemoteNotifications];   	   L	PFInstallation *currentInstallation = [PFInstallation currentInstallation];   $	currentInstallation.channels = @[];   &	[currentInstallation saveEventually];   }       #pragma mark - Accessors       - (UIWindow *)window   {   	if (!_window) {   H		_window = [[PLWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];   	}   	   	return _window;   }       #pragma mark - Debug       	#if DEBUG       "- (void)findMisbehavingScrollViews   {   S	[self findMisbehavingScrollViewsInView:UIApplication.sharedApplication.keyWindow];   }   7- (void)findMisbehavingScrollViewsInView:(UIView *)view   {   V	if ([view isKindOfClass:UIScrollView.class] && [(UIScrollView *)view scrollsToTop]) {   		NSLog(@"%@", view);   	}   	   )	for (UIView *subview in view.subviews) {   2		[self findMisbehavingScrollViewsInView:subview];   	}   }       #endif       #pragma mark - Configuration       - (void)configureCrashlytics   {   3	[Crashlytics startWithAPIKey:PLCrashlyticsAPIKey];   }   - (void)configureFlurry   {   #if APP_STORE   &	[Flurry startSession:PLFlurryAPIKey];   #endif   }   - (void)configureHockey   {   
#if AD_HOC   C	BITHockeyManager *hockey = [BITHockeyManager sharedHockeyManager];   "	hockey.disableCrashManager = YES;   B	[hockey configureWithIdentifier:PLHockeyIdentifier delegate:nil];   	[hockey startManager];   #endif   }   - (void)configureMagicalRecord   {   X	[MagicalRecord setErrorHandlerTarget:self action:@selector(handleMagicalRecordError:)];   #if !APP_STORE   9	[MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];   #endif   1	[MagicalRecord setupAutoMigratingCoreDataStack];   }   - (void)configureParse   {   J	[Parse setApplicationId:PLParseApplicationID clientKey:PLParseClientKey];   }   - (void)configureXCallbackURL   {   <	SBRCallbackParser *parser = SBRCallbackParser.sharedParser;    	parser.URLScheme = PLURLScheme;   }   "- (void)customizeAppearanceProxies   {   9	PLPageControl *pageControl = [PLPageControl appearance];   W	pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"PageControlDotCurrent"];   I	pageControl.pageIndicatorImage = [UIImage imageNamed:@"PageControlDot"];   #	pageControl.indicatorMargin = 4.0;   	   E	UIFont *font = [UIFont fontWithName:@"AvenirNext-Medium" size:17.0];   r	UINavigationBar *navigationBar = [UINavigationBar appearanceWhenContainedIn:[PLNavigationController class], nil];   '	navigationBar.titleTextAttributes = @{   		NSFontAttributeName: font,   O		NSForegroundColorAttributeName: [UIColor colorWithWhite:64.0/255.0 alpha:1.0]   	};   	   r	UIBarButtonItem *barButtonItem = [UIBarButtonItem appearanceWhenContainedIn:[PLNavigationController class], nil];   )	[barButtonItem setTitleTextAttributes:@{   		NSFontAttributeName: font,   "	} forState:UIControlStateNormal];   }       #pragma mark - Lifetime       
- (id)init   {   	self = [super init];   	if (!self) return nil;   	   A	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];   �	[nc addObserver:self selector:@selector(performLogOut) name:PLAPIClientDidResetInvalidAuthenticationTokenNotification object:nil];   	   	return self;   }       - (void)dealloc   {   :	[NSNotificationCenter.defaultCenter removeObserver:self];   }       &#pragma mark - <UIApplicationDelegate>       l- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions   {   	[self configureFlurry];   	[self configureHockey];   	[self configureMagicalRecord];   	[self configureParse];   	[self configureXCallbackURL];   #	[self customizeAppearanceProxies];   	   	// Crashlytics goes last.   	[self configureCrashlytics];   	   4	if (PLAPIClient.sharedClient.authenticationToken) {   &		[self registerForPushNotifications];   	}   	   	return YES;   }   �- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation   {   3	if ([FBSession.activeSession handleOpenURL:url]) {   		return YES;   =	} else if ([SBRCallbackParser.sharedParser handleURL:url]) {   		return YES;   		} else {   		return NO;   	}   }   							   ?- (void)applicationDidBecomeActive:(UIApplication *)application   {   ,	application.applicationIconBadgeNumber = 0;   }   B- (void)applicationDidEnterBackground:(UIApplication *)application   {   v	UIBackgroundTaskIdentifier identifier = [application beginBackgroundTaskWithName:@"Save Data" expirationHandler:nil];   	   5	[[NSUserDefaults standardUserDefaults] synchronize];   u	[[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {   X		if (identifier != UIBackgroundTaskInvalid) [application endBackgroundTask:identifier];   	}];   }   �- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler   {   F	if (application.applicationState == UIApplicationStateActive) return;   	   Q	UIViewController *rootViewController = application.keyWindow.rootViewController;   5	while (rootViewController.presentedViewController) {   B		rootViewController = rootViewController.presentedViewController;   	}   	   $	NSString *path = userInfo[@"path"];   #	if ([path hasPrefix:@"/people"]) {   u		PLNavigationController *navigationController = [UIStoryboard.pl_peopleStoryboard instantiateInitialViewController];   b		PLPeopleViewController *peopleViewController = navigationController.viewControllers.firstObject;   =		peopleViewController.shouldDisplayNewActivitySection = YES;       ^		[rootViewController presentViewController:navigationController animated:YES completion:nil];   3		completionHandler(UIBackgroundFetchResultNoData);   )	} else if ([path hasPrefix:@"/rooms"]) {   8		NSString *identifier = path.pathComponents.lastObject;   V		[PLAPIClient.sharedClient fetchRoomWithIdentifier:identifier success:^(Room *room) {   N			void (^presentRoom)(UIViewController *) = ^(UIViewController *presenting) {   f				PLRoomViewController *roomViewController = [PLRoomViewController roomViewControllerWithRoom:room];   E				roomViewController.movesCardToTableViewHeaderOnViewDidLoad = YES;   E				roomViewController.statusBarStyle = UIStatusBarStyleLightContent;   				[roomViewController view];   (				roomViewController.dismissBlock = ^{   C					[presenting dismissViewControllerAnimated:YES completion:nil];   				};       S				[presenting presentViewController:roomViewController animated:YES completion:^{   7					completionHandler(UIBackgroundFetchResultNewData);   				}];   			};   			   �			if ([rootViewController respondsToSelector:@selector(visibleViewController)] && [[(UINavigationController *)rootViewController visibleViewController] isKindOfClass:[PLRoomViewController class]]) {   O				UIViewController *presenting = rootViewController.presentingViewController;   ?				[presenting dismissViewControllerAnimated:YES completion:^{   					presentRoom(presenting);   				}];   			} else {   $				presentRoom(rootViewController);   			}   		} failure:^(NSError *error) {   4			completionHandler(UIBackgroundFetchResultFailed);   		}];   	}   }   w- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken   {   L	PFInstallation *currentInstallation = [PFInstallation currentInstallation];   :	[currentInstallation setDeviceTokenFromData:deviceToken];   	   v	NSString *userChannel = [NSString stringWithFormat:@"user-%d", NSUserDefaults.standardUserDefaults.pl_currentUserID];   <	currentInstallation.channels = @[ @"global", userChannel ];   &	[currentInstallation saveEventually];   }   =- (void)applicationWillTerminate:(UIApplication *)application   {   5	[[NSUserDefaults standardUserDefaults] synchronize];   N	[[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];   }       @end5�_�   /   1           0     S    ����                                                                                                                                                                                                                                                                                                                                                             R�B�    �      0      �			if ([rootViewController respondsToSelector:@selector(visibleViewController)] && [[(UINavigationController *)rootViewController visibleViewController] isKindOfClass:[PLRoomViewController class]]) {5�_�   0   2           1         ����                                                                                                                                                                                                                                                                                                                                                             R�Ca     �      2      				�      1    5�_�   1   3           2         ����                                                                                                                                                                                                                                                                                                                                                             R�Ck     �      2      				NSLog(@"%@")5�_�   2   4           3         ����                                                                                                                                                                                                                                                                                                                                                             R�Cn     �      2      				NSLog(@"%@", presenting)5�_�   3               4         ����                                                                                                                                                                                                                                                                                                                                                             R�Cq    �      2      				NSLog(@"%@", presenting);5��