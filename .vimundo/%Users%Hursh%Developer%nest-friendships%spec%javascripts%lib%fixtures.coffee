Vim�UnDo� 㕅?z����g�Y.�9
��A�7�9�   #                 3       3   3   3    RA��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             R@ZJ     �                 5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             R@ZJ     �                7sharedFixtures = require 'nest-shared-clients/fixtures'5�_�                            ����                                                                                                                                                                                                                                                                                                                                       S           V        R@ZL     �             ?     suggestedLinks:       linkOne:         id: 1   $      topic: "This is a great link!"   ;      card_info_id: sharedFixtures.cardInfos.cardInfoOne.id         hidden: false   *      active_at: Date.create("2 days ago")   +      created_at: Date.create("5 days ago")   +      updated_at: Date.create("5 days ago")           linkTwo:         id: 2         topic: "Awesome link"   ;      card_info_id: sharedFixtures.cardInfos.cardInfoTwo.id         hidden: false   *      active_at: Date.create("3 days ago")   +      created_at: Date.create("5 days ago")   +      updated_at: Date.create("5 days ago")           hiddenLink:         id: 3   ,      topic: "ultricies vehicula ut id elit"   ;      card_info_id: sharedFixtures.cardInfos.cardInfoOne.id         hidden: true   *      active_at: Date.create("2 days ago")   +      created_at: Date.create("5 days ago")   +      updated_at: Date.create("5 days ago")           actedOnLinkOne:         id: 6   6      topic: "Sed posuere consectetur est at lobortis"   ;      card_info_id: sharedFixtures.cardInfos.cardInfoTwo.id         hidden: false   *      active_at: Date.create("2 days ago")   +      created_at: Date.create("5 days ago")   +      updated_at: Date.create("5 days ago")           actedOnLinkTwo:         id: 7   )      topic: "Lorem ipsum dolor sit amet"   ;      card_info_id: sharedFixtures.cardInfos.cardInfoOne.id         hidden: false   *      active_at: Date.create("2 days ago")   +      created_at: Date.create("5 days ago")   +      updated_at: Date.create("5 days ago")           soonActiveLink:         id: 5   &      topic: "Nullam id dolor id nibh"   ;      card_info_id: sharedFixtures.cardInfos.cardInfoTwo.id         hidden: false   1      active_at: Date.create("1 minute from now")   +      created_at: Date.create("5 days ago")   +      updated_at: Date.create("5 days ago")           notYetActiveLink:         id: 4   !      topic: "Aenean eu leo quam"   ;      card_info_id: sharedFixtures.cardInfos.cardInfoOne.id         hidden: false   /      active_at: Date.create("1 week from now")   +      created_at: Date.create("5 days ago")   +      updated_at: Date.create("5 days ago")5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        R@ZN     �               /module.exports = fixtures.merge(sharedFixtures)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        R@ZO     �               module.exports = fixtures.5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                  V        R@ZR    �               
fixtures =5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �               5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �                 5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �                 5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�    �                module.exports = fixtures5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �         !          friender_id: users.ian.id5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �         !      %    friendee_id: users.ians_friend.id5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �          !      '    friender_id: users.requests_alot.id5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �      !   !          friendee_id: users.ian.id5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �         !      &models = require "../../../../models/"5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �         !      *Friendship = require "../../../../models/"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �         !      '    status: models.Friendship::ACCEPTED5�_�                    !       ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�    �                  &    status: models.Friendship::PENDING5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�     �                fixtures = {}5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        R@Z�    �                 5�_�                          ����                                                                                                                                                                                                                                                                                                                                                  V        R@j�     �                  �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       R@j�    �                   ian_ians_friend:       friender_id: 1       friendee_id: 6        status: Friendship::ACCEPTED     requests_alot_ian:       friender_id: 1       friendee_id: 6       status: Friendship::PENDING5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       R@j�     �                      friender_id: 15�_�                           ����                                                                                                                                                                                                                                                                                                                                                 V       R@j�    �                       friendee_id: 65�_�                            ����                                                                                                                                                                                                                                                                                                                                                 V       R@l�     �         !            �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                      !          V       R@l�     �          "            �          !    5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                      "          V       R@l�     �         "            id: 145�_�      '                 
    ����                                                                                                                                                                                                                                                                                                                                      "          V       R@l�    �          "            id: 825�_�      (          '          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@m�     �         "      4Friendship = require "../../../../models/friendship"5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@m�     �         "      3Friendship = require "../../.././models/friendship"5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@m�   
 �         "      2Friendship = require "../../..//models/friendship"5�_�   )   +           *           ����                                                                                                                                                                                                                                                                                                                                      "          V       R@m�    �                users = require "./users"5�_�   *   ,           +           ����                                                                                                                                                                                                                                                                                                                                      !          V       R@m�    �         !          requests_alot_ian:5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                      !          V       R@q�     �         "            �         !    5�_�   ,   .           -   "       ����                                                                                                                                                                                                                                                                                                                                      "          V       R@q�     �   "                    �   "            5�_�   -   /           .   #       ����                                                                                                                                                                                                                                                                                                                                      "          V       R@q�    �   "                    hidden: fales5�_�   .   0           /          ����                                                                                                                                                                                                                                                                                                                                                             RA��     �         #      "      status: Friendship::ACCEPTED5�_�   /   1           0   "       ����                                                                                                                                                                                                                                                                                                                                                             RA��     �   !   #   #      !      status: Friendship::PENDING5�_�   0   2           1           ����                                                                                                                                                                                                                                                                                                                                                             RA��     �                1Friendship = require "../../../models/friendship"5�_�   1   3           2           ����                                                                                                                                                                                                                                                                                                                                                             RA��    �                 5�_�   2               3           ����                                                                                                                                                                                                                                                                                                                                                             RA��     �               !   #####   ;# Fixtures are to be used directly with mock_clients.coffee   #   H# The idea is these JSON objects represent the underlying data structure   *# and mock_clients turns them into models.   #   6# In order for the fixtures pattern to work they must:   J#   - The data must look like how it would look in the production database   Q#   - Be immutable. It is possible to make them mutable over the course of a test   Q#       but if that is the case then the data must be reloaded before every test.   N#   - Be general. The usecases here should cover all use cases, and should try   O#       to be as general as possible. If every test has its own one off fixture   8#       then these files will become overly complicated.   #   P# In order to add fixtures simply add JSON to the following files. Every fixture   K# needs its own property, which is used for accessing it in tests and other   Q# fixtures. Please use references for things like IDs etc, rather than hardcoding   1# them. Be careful of circular references though.       module.exports =     friendships:       ian_ians_friend:         id: 1         friender_id: 1         friendee_id: 6         status: "accepted"         hidden: false       requests_alot_ian:         id: 2         friender_id: 2         friendee_id: 1         status: "pending"         hidden: false5�_�             '             ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mb     �         "      3Friendship = require "./../../../models/friendship"5�_�                            ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mb     �         "      2Friendship = require "/../../../models/friendship"5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mb     �         "      1Friendship = require "../../../models/friendship"5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mb     �         "      0Friendship = require "./../../models/friendship"5�_�   !   #           "          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mb     �         "      /Friendship = require "/../../models/friendship"5�_�   "   $           #          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mb     �         "      .Friendship = require "../../models/friendship"5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mc     �         "      -Friendship = require "./../models/friendship"5�_�   $   &           %          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@mc     �         "      ,Friendship = require "/../models/friendship"5�_�   %               &          ����                                                                                                                                                                                                                                                                                                                                      "          V       R@md   	 �         "      +Friendship = require "../models/friendship"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        R@j�     �                   getFriendIndex: (userId) ->   f      friender_ids = fixtures.friendships.values().findAll({friendee_id: userId}).pluck("friender_id")   f      friendee_ids = fixtures.friendships.values().findAll({friender_id: userId}).pluck("friendee_id")   4      Q(friender_ids.include(friendee_ids).unique())    5��