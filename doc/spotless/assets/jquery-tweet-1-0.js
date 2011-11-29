/* jQuery Tweet v1.0 <http://tweet.seaofclouds.com>. Copyright (c) 2009 Sea of Clouds. Dual licensed under the MIT license. */
(function(A){A.fn.tweet=function(D){var C={username:["pixallent"],avatar_size:null,count:1,intro_text:null,outro_text:null,join_text:null,auto_join_text_default:"i said,",auto_join_text_ed:"i",auto_join_text_ing:"i am",auto_join_text_reply:"i replied to",auto_join_text_url:"i was looking at",loading_text:null,query:null};A.fn.extend({linkUrl:function(){var E=[];var F=/((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/gi;this.each(function(){E.push(this.replace(F,'<a href="$1">$1</a>'))});return A(E)},linkUser:function(){var E=[];var F=/[\@]+([A-Za-z0-9-_]+)/gi;this.each(function(){E.push(this.replace(F,'<a href="http://twitter.com/$1">@$1</a>'))});return A(E)},linkHash:function(){var E=[];var F=/ [\#]+([A-Za-z0-9-_]+)/gi;this.each(function(){E.push(this.replace(F,' <a href="http://search.twitter.com/search?q=&tag=$1&lang=all&from='+C.username.join("%2BOR%2B")+'">#$1</a>'))});return A(E)},capAwesome:function(){var E=[];this.each(function(){E.push(this.replace(/(a|A)wesome/gi,"AWESOME"))});return A(E)},capEpic:function(){var E=[];this.each(function(){E.push(this.replace(/(e|E)pic/gi,"EPIC"))});return A(E)},makeHeart:function(){var E=[];this.each(function(){E.push(this.replace(/[&lt;]+[3]/gi,"<tt class='heart'>&#x2665;</tt>"))});return A(E)}});function B(F){var E=Date.parse(F);var G=(arguments.length>1)?arguments[1]:new Date();var H=parseInt((G.getTime()-E)/1000);if(H<60){return"less than a minute ago"}else{if(H<120){return"about a minute ago"}else{if(H<(45*60)){return(parseInt(H/60)).toString()+" minutes ago"}else{if(H<(90*60)){return"about an hour ago"}else{if(H<(24*60*60)){return"about "+(parseInt(H/3600)).toString()+" hours ago"}else{if(H<(48*60*60)){return"1 day ago"}else{return(parseInt(H/86400)).toString()+" days ago"}}}}}}}if(D){A.extend(C,D)}return this.each(function(){var I=A('<ul class="tweet_list">').appendTo(this);var H='<p class="tweet_intro">'+C.intro_text+"</p>";var E='<p class="tweet_outro">'+C.outro_text+"</p>";var J=A('<p class="loading">'+C.loading_text+"</p>");if(typeof (C.username)=="string"){C.username=[C.username]}var G="";if(C.query){G+="q="+C.query}G+="&q=from:"+C.username.join("%20OR%20from:");var F="http://search.twitter.com/search.json?&"+G+"&rpp="+C.count+"&callback=?";if(C.loading_text){A(this).append(J)}A.getJSON(F,function(K){if(C.loading_text){J.remove()}if(C.intro_text){I.before(H)}A.each(K.results,function(O,T){if(C.join_text=="auto"){if(T.text.match(/^(@([A-Za-z0-9-_]+)) .*/i)){var M=C.auto_join_text_reply}else{if(T.text.match(/(^\w+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&\?\/.=]+) .*/i)){var M=C.auto_join_text_url}else{if(T.text.match(/^((\w+ed)|just) .*/im)){var M=C.auto_join_text_ed}else{if(T.text.match(/^(\w*ing) .*/i)){var M=C.auto_join_text_ing}else{var M=C.auto_join_text_default}}}}}else{var M=C.join_text}var R='<span class="tweet_join"> '+M+" </span>";var L=((C.join_text)?R:" ");var P='<a class="tweet_avatar" href="http://twitter.com/'+T.from_user+'"><img src="'+T.profile_image_url+'" height="'+C.avatar_size+'" width="'+C.avatar_size+'" alt="'+T.from_user+'\'s avatar" border="0"/></a>';var Q=(C.avatar_size?P:"");var N='<a href="http://twitter.com/'+T.from_user+"/statuses/"+T.id+'" title="view tweet on twitter">'+B(T.created_at)+"</a>";var S='<span class="tweet_text">'+A([T.text]).linkUrl().linkUser().linkHash().makeHeart().capAwesome().capEpic()[0]+"</span>";I.append("<li>"+Q+N+L+S+"</li>");I.children("li:first").addClass("tweet_first");I.children("li:odd").addClass("tweet_even");I.children("li:even").addClass("tweet_odd")});if(C.outro_text){I.after(E)}})})}})(jQuery);