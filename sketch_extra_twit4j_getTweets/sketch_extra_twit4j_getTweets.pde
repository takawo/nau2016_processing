import controlP5.*;

import twitter4j.*;
import twitter4j.api.*;
import twitter4j.auth.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.management.*;
import twitter4j.util.*;
import twitter4j.util.function.*;

import java.util.*;


// get app_info for https://dev.twitter.com/
// reference  http://www.pentacreation.com/blog/2016/10/161022.html 
String consumerKey = "";
String consumerSecret = "";
String accessToken = "";
String accessSecret = "";

PFont font;

Twitter twitter;
List<Status> statuses;

ControlP5 cp5;
Textarea tweetText;

// setup関数 : 初回1度だけ実行される
void setup() {
  size(960, 800); // ウィンドウサイズを960px,540pxに
  colorMode(HSB, 360, 100, 100); // HSBでの色指定にする
  smooth(); // 描画を滑らかに

  font = createFont("YuGothic-Light", 10);
  textFont(font);


  ConfigurationBuilder builder = new ConfigurationBuilder();
  builder.setOAuthConsumerKey(consumerKey);
  builder.setOAuthConsumerSecret(consumerSecret);
  builder.setOAuthAccessToken(accessToken);
  builder.setOAuthAccessTokenSecret(accessSecret);

  twitter = new TwitterFactory(builder.build()).getInstance();

  cp5 = new ControlP5(this);

  try {

    User user = twitter.showUser("@takawo");
    long id = user.getId();
    //statuses = twitter.getUserTimeline(id);
    statuses = twitter.getHomeTimeline();

      for (int i = 0; i < statuses.size(); i++) {
      Status s = statuses.get(i);
      String userName = s.getUser().getName();
      String screenName = "@" + s.getUser().getScreenName();
      String tweet = s.getText();
      PImage icon = loadImage(s.getUser().getOriginalProfileImageURL(), "png");    //image
      image(icon,0,80*i,80,80);

      tweetText = cp5.addTextarea(
        "label" + i,
         userName + "/" + screenName + str(char(10)) + tweet,
        80, (80*i), width-80, 80);
      tweetText.setColorBackground(color(0, 0, 100))
        .setFont(font)
        .setColor(color(0, 0,0))
        .setLineHeight(20);
    }
  }
  catch(TwitterException e) {
    println("Get timeline : " + e + " / Status code : " + e.getStatusCode());
  }
}

// draw関数 : setup関数実行後繰り返し実行される
void draw() {
}
