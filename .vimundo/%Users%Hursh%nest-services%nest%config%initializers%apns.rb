Vim�UnDo� �1P(APZ��FM� <%���{R0c�#��7z��                                      R���    _�                             ����                                                                                                                                                                                                                                                                                                                                                  V        R�^�     �                end�   
               end�   	                 end�      
          O      Rails.logger.info("Would have sent push notifications: #{notifications}")�      	          .    def self.send_notifications(notifications)�                  module APNS�                unless Rails.env.production?5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        R�^�     �                 if Rails.env.production?5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        R�^�    �                end5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        R���     �                  #if Rails.env.production?   M  APNS.pem = Rails.root.join("config", "certificates", "production_push.pem")   &  APNS.host = 'gateway.push.apple.com'   #end       #unless Rails.env.production?     #module APNS   /    #def self.send_notifications(notifications)   P      #Rails.logger.info("Would have sent push notifications: #{notifications}")       #end     #end   #end5��