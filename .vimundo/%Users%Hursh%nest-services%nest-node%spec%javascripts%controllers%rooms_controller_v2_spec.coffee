Vim�UnDo� {	.�Ҁ�K�`�����5ɡ%.:t��a�9   �                                  R��    _�                    l   *    ����                                                                                                                                                                                                                                                                                                                                                             Re�G    �   k   m   z      2      mockClientsWithFriendship.friendshipClient =5�_�      	             /       ����                                                                                                                                                                                                                                                                                                                                                             R��     �   0   2              it �   /   2   {              �   /   1   z    5�_�      
           	   1   '    ����                                                                                                                                                                                                                                                                                                                                                             R��     �   0   3   |      '    it 'respects the excludedIds array'5�_�   	              
   1       ����                                                                                                                                                                                                                                                                                                                                                 V       R��     �   1   :   }    5�_�   
                 4       ����                                                                                                                                                                                                                                                                                                                                                 V       R�     �   3   4                  limit: 15�_�                    4       ����                                                                                                                                                                                                                                                                                                                                                 V       R�     �   3   4                  offset: 05�_�                    3        ����                                                                                                                                                                                                                                                                                                                                                 V       R�     �   3   5   �              �   3   5   �    5�_�                    3       ����                                                                                                                                                                                                                                                                                                                                                 V       R�&     �   2   4   �               currentUser: currentUser5�_�                    4       ����                                                                                                                                                                                                                                                                                                                                                 V       R�0     �   3   5   �              excludedIds: 5�_�                    6   3    ����                                                                                                                                                                                                                                                                                                                                                 V       R�>     �   6   8   �              �   6   8   �    5�_�                    7   B    ����                                                                                                                                                                                                                                                                                                                                                 V       R�U     �   6   8   �      R        roomIds = fixtures.timeline.andrews_long_timeline.timeline.exclude.apply()5�_�                    7   A    ����                                                                                                                                                                                                                                                                                                                                                 V       R�W     �   7   9   �    5�_�                    7       ����                                                                                                                                                                                                                                                                                                                                                 V       R�Y     �   7   9   �              �   7   9   �    5�_�                    8   1    ����                                                                                                                                                                                                                                                                                                                                                 V       R�e     �   7   9   �      2        roomIds = roomIds.exclude.apply(roomIds, )5�_�                    :   3    ����                                                                                                                                                                                                                                                                                                                                                 V       R�n     �   9   ;   �      h        expect(response.rooms.pluck("id")).toEqual(fixtures.timelines.ians.timeline.first(params.limit))5�_�                    ;        ����                                                                                                                                                                                                                                                                                                                                                 V       R�u    �   :   ;           5�_�                    3   .    ����                                                                                                                                                                                                                                                                                                                                                 V       R�    �   2   4   �      ?        currentUser: new models.User(fixtures.User.ians_friend)5�_�                    4       ����                                                                                                                                                                                                                                                                                                                                                 V       R�    �   3   5   �      +        excludedIds: [ rooms.ians_room.id ]5�_�                   7   #    ����                                                                                                                                                                                                                                                                                                                                                 V       R�.    �   6   8   �      B        roomIds = fixtures.timeline.andrews_long_timeline.timeline5�_�                    9        ����                                                                                                                                                                                                                                                                                                                                                 V       R�X     �   9   ;   �              �   9   ;   �    5�_�                    :       ����                                                                                                                                                                                                                                                                                                                                                 V       R�_    �   9   ;   �              console.log "room"5�_�                    4   '    ����                                                                                                                                                                                                                                                                                                                                                 V       R��    �   4   7   �              �   4   6   �    5�_�                     <       ����                                                                                                                                                                                                                                                                                                                                                 V       R��    �   ;   <          (        console.log "response", response5�_�                    4        ����                                                                                                                                                                                                                                                                                                                                                 V       R�'     �   3   5   �      /        excludedIds: [ fixtures..ians_room.id ]5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             R��     �         z      <    it "return a user's stack and excludes excluded ids", ->5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             Re�1     �         z       5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             Re�3     �              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Re�.     �         z       �         {      g5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Re�-     �          z      requgire('../spec_helper')()5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             Re�(     �          z      frequire('../spec_helper')()5��