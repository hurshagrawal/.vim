Vim�UnDo� n��#W`��G���A�ѫ�+�L��'�G�c�QP   G                                  Rir�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             Rf�q     �         H          �         G    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Rf�s     �                    console5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Rf�s     �         G    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Rf�t     �         H          console5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Rf�x     �         H          console.log("given type")5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Rf�y     �         H          console.log("given type")5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Rf�|     �         H      (    console.log("given type" ,givenType)5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                             Rf�}     �         H      '    console.log("given type",givenType)5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             Rf��     �         H      (    console.log("given type", givenType)5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             Rf��    �                (    console.log "given type", givenType 5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                             Rf�}     �               H   `WHITELIST_RICH_PROVIDERS = ['twitter', 'soundcloud', 'spotify', 'amazon', 'foursquare', 'hypem']   [WHITELIST_RICH_PROVIDERS_REGEX = new RegExp("(#{WHITELIST_RICH_PROVIDERS.join('|')}\.com)")           class EmbedlyResponseFormatter   .  constructor: (@originalUrl, @rawResponse) ->         asCardInfoJson: ->       type: @type()       original_url: @originalUrl       image_url: @imageUrl()   "    thumbnail_url: @thumbnailUrl()   $    dominant_color: @dominantColor()   )    favicon_url: @rawResponse.favicon_url   -    type_specific_attrs: @typeSpecificAttrs()   (    provider: @rawResponse.provider_name           
  type: ->   (    givenType = @rawResponse.oembed.type   '    console.log "given type", givenType   1    # embedly is prone to screwing up with tweets   F    if (givenType == 'photo' || givenType == 'link') && @_urlIsTweet()         givenType = 'rich'           type = switch givenType   (      when 'photo', 'image' then 'image'         when 'link' then 'link'         when 'video' then 'video'         when 'rich'   <        if @originalUrl.match WHITELIST_RICH_PROVIDERS_REGEX             'rich'           else             'link'       type         imageUrl: ->       if @type() == 'image'         @originalUrl       else   '      @rawResponse.oembed.thumbnail_url         thumbnailUrl: ->       @imageUrl() # BUT SMALLER         dominantColor: ->   :    color = @rawResponse.oembed.dominant_colors?[0]?.color       if color         color.join(',')       else         ""         typeSpecificAttrs: ->       type = @type()   K    # again, embedly may have screwed up, so we fake the embed in this case   '    if type == 'rich' && @_urlIsTweet()   �      { embed_html:"<blockquote class=\"twitter-tweet\"><a href=\"#{@originalUrl}\"></a></blockquote><script async src=\"//platform.twitter.com/widgets.js\" charset=\"utf-8\"></script>"  }       else         switch type           when 'image'   5          images = @rawResponse.images.map (image) ->   <            { image_url: image.url, caption: image.caption }             { images: images }           when 'link'   8          { content: @rawResponse.article?.description }           when 'rich', 'video'   0          {embed_html: @rawResponse.oembed.html}         _urlIsTweet: ->   Y    @rawResponse.oembed.provider_name == "Twitter" && @originalUrl.match(/\/status\/\d+/)       )module.exports = EmbedlyResponseFormatter5�_�                    @   6    ����                                                                                                                                                                                                                                                                                                                                                             Rio�    �   ?   A   G      8          { content: @rawResponse.article?.description }5�_�                    ?       ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   ?   A   H      
          �   ?   A   G    5�_�                    @       ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   ?   A   H                console.log "linkA"5�_�                    @       ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   ?   A   H                console.log "link"5�_�                    @   >    ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   @   B   H    5�_�                    @       ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   ?   A   I      ?          console.log "link", @rawResponse.article?.description5�_�                    @       ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   @   B   I    5�_�                    B        ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   A   B           5�_�                    A       ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   @   B   I      A          console.log "desc 1", @rawResponse.article?.description5�_�                    A   -    ����                                                                                                                                                                                                                                                                                                                                                             Rip�     �   @   B   I      A          console.log "desc 2", @rawResponse.article?.description5�_�                    A   7    ����                                                                                                                                                                                                                                                                                                                                                             Rip�    �   A   C   I    5�_�                    E       ����                                                                                                                                                                                                                                                                                                                                                             Rip�    �   D   F   J      0          {embed_html: @rawResponse.oembed.html}5�_�                     @        ����                                                                                                                                                                                                                                                                                                                            @   -       B           V   -    Rir�    �   ?   @          A          console.log "desc 1", @rawResponse.article?.description   8          console.log "desc 2", @rawResponse.description    5��