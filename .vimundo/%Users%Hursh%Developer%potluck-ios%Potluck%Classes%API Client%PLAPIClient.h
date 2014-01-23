VimUnDoå ¶êÒvü .,c³ }«¸8±wÉx	   C                                   RÀ     _Ð                      ?        ÿÿÿÿ                                                                                                                                                                                                                                                                                                                                                             R¿     õ               B   //   //  PLAPIClient.h   //  Potluck   //   +//  Created by Alexsander Akers on 8/21/13.   >//  Copyright (c) 2013 Branch Media, Inc. All rights reserved.   //       @import SystemConfiguration;   @import MobileCoreServices;   -#import <AFNetworking/AFHTTPSessionManager.h>   1#import <AFNetworking/AFURLConnectionOperation.h>   #import "Post.h"   #import "Room.h"       ,extern const NSUInteger PLDefaultFetchLimit;   Qextern NSString *const PLAPIClientDidResetInvalidAuthenticationTokenNotification;       -@interface PLAPIClient : AFHTTPSessionManager       + (PLAPIClient *)sharedClient;       #pragma mark - Requests       "- (NSString *)authenticationToken;       !- (void)resetAuthenticationToken;       #pragma mark - Requests       ª- (NSURLSessionDataTask *)authenticateWithEmail:(NSString *)email password:(NSString *)password success:(void (^)(void))success failure:(void (^)(NSError *error))failure;  - (NSURLSessionDataTask *)createAccountWithEmail:(NSString *)email username:(NSString *)username password:(NSString *)password firstName:(NSString *)firstName lastName:(NSString *)lastName success:(void (^)(void))success failure:(void (^)(NSError *error, NSArray *errorStrings))failure;   |- (NSURLSessionDataTask *)deletePost:(Post *)post success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   è- (NSURLSessionDataTask *)fetchAddressBookFriendsWithSourcePhoneNumberHash:(NSString *)sourceHash targetPhoneNumberHashes:(NSArray *)targetHashes success:(void (^)(NSArray *friends))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)fetchCurrentlyFollowedUsersWithSuccess:(void (^)(NSArray *following))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)fetchFacebookFriendsWithSuccess:(void (^)(NSArray *friends))success failure:(void (^)(NSError *error))failure;   w- (NSURLSessionDataTask *)fetchHeartsFeedWithSuccess:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)fetchInboxFeedAtPage:(NSUInteger)page success:(void (^)(NSArray *rooms))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)fetchPostsForRoom:(Room *)room success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)fetchRoomsExcludingIDs:(NSArray *)excludedIDs success:(void (^)(NSArray *rooms))success failure:(void (^)(NSError *error))failure;   °- (NSURLSessionDataTask *)fetchSuggestedUsersWithSuccess:(void (^)(NSArray *suggestedUsers, NSArray *justJoinedNotifications))success failure:(void (^)(NSError *error))failure;   ¨- (NSURLSessionDataTask *)fetchSuggestionsExcludingIDs:(NSArray *)excludedIDs success:(void (^)(NSArray *suggestions))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)fetchUnreadNotificationCounts:(void (^)(NSUInteger inbox, NSUInteger people))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)fetchTwitterFriendsWithSuccess:(void (^)(NSArray *friends))success failure:(void (^)(NSError *error))failure;   |- (NSURLSessionDataTask *)followUser:(User *)user success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)followUsersWithIDs:(NSArray *)userIDs success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)followUserWithID:(NSNumber *)userID success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   ä- (NSURLSessionDataTask *)linkUserWithFacebookUID:(NSNumber *)facebookUID usingToken:(NSString *)accessToken expirationDate:(NSDate *)tokenExpirationDate success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   Ò- (NSURLSessionDataTask *)linkUserWithTwitterID:(NSNumber *)twitterID usingToken:(NSString *)accessToken secret:(NSString *)tokenSecret success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)markPostAsStarred:(Post *)post success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)markRoomAsRead:(Room *)room success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)markRoomAsStarred:(Room *)room success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)markSuggestedLinkAsRead:(SuggestedLink *)suggestedLink success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   ¤- (NSURLSessionDataTask *)markSuggestedLinkAsStarred:(SuggestedLink *)suggestedLink success:(void (^)(Room *room))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)postComment:(NSString *)comment toRoom:(Room *)room success:(void (^)(Post *post))success failure:(void (^)(NSError *error))failure;   ¹- (NSURLSessionDataTask *)postComment:(NSString *)comment toSuggestedLink:(SuggestedLink *)suggestedLink success:(void (^)(Room *room))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)searchUsersWithQuery:(NSString *)query success:(void (^)(NSArray *results))success failure:(void (^)(NSError *error))failure;   ~- (NSURLSessionDataTask *)unfollowUser:(User *)user success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)unfollowUserWithID:(NSNumber *)userID success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   - (NSURLSessionDataTask *)unmarkPostAsStarred:(Post *)post success:(void (^)(void))success failure:(void (^)(NSError *error))failure;  $- (NSURLSessionDataTask *)updateAccountWithEmail:(NSString *)email password:(NSString *)password oldPassword:(NSString *)oldPassword firstName:(NSString *)firstName lastName:(NSString *)lastName success:(void (^)(void))success failure:(void (^)(NSError *error, NSArray *errorStrings))failure;   - (NSURLSessionDataTask *)updateAvatar:(UIImage *)avatar success:(void (^)(void))success failure:(void (^)(NSError *error))failure;   y- (NSURLSessionDataTask *)updateCurrentUserWithSuccess:(void (^)(void))success failure:(void (^)(NSError *error))failure;   Ã- (void)uploadSnackWithComposeItems:(NSArray *)composeItems title:(NSString *)title taggedFriends:(NSArray *)users success:(void (^)(Room *room))success failure:(void (^)(NSError *error))failure;       @end5çª