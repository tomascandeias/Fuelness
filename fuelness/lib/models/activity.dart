 import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import './activity_facts.dart';

class Activity {
  final int id;
  final int iconCode;
  final String name;
  final String imagePath;
  final List<ActivityFacts> facts;

  Activity(this.id, this.iconCode, this.name, this.imagePath, this.facts);

  static List<Activity> fetchAll() {
    return [
      Activity(0, 0xe1dc, "Running", "assets/images/running.jpeg", [
        ActivityFacts("Benefits",
            "Improves cardiovascular health, build muscular strenght, increases bone density, improves markers of health, reduce stress, boosts confidence, burns calories, accessibility, improves your mood and can connect you to nature and can be social."),
        ActivityFacts("Getting Started with Running",
            "In many ways, running is as simple as it sounds, and we are innately wired to have the movement patterns we need to run. However, getting started with running isn’t just a matter of lacing up your running shoes and hitting the road—or at least that’s not the full extent of it. Because running is a high-impact activity, you need to progress slowly and build up your volume—mileage, and speed—over time. If you’re not currently running, or are just starting out, consider the following helpful guidelines for a safe introduction and initiation into running."),
        ActivityFacts("Starting With Walking",
            "Depending on your current fitness level, you may need to start out with walking. If you haven’t been active at all for quite some time, just walk the first week, increasing your distance and speed each day. If you’re hitting the gym, or working out in other ways, you may be able to jump right into jogging, though many beginning running programs recommend interspersing walking breaks into your running over the first couple of weeks. Walking breaks give your heart and lungs a chance to relax a little and also change up the muscular demand on your legs. As you get fitter, reduce the frequency and duration of walking breaks."),
        ActivityFacts("Don't Push Yourself Too Hard",
            "It takes the muscles, bones, tendons, and ligaments longer to adapt to the stresses and impact of running than it does for your cardiovascular system to adapt to the aerobic demands. In other words, you may feel like you can keep going and do more miles from a breathing standpoint, but you should limit your mileage as you get started running to avoid overdoing it on your body and risking musculoskeletal injury. Many beginning runners become overly eager and end up sidelined with an injury in the first few weeks of training. This can be sidestepped with a conservative, gradual increase in distance and speed."),
        ActivityFacts("Get Fitted for Shoes",
            "Visit a local running shop to get your gait analyzed. Shoe experts can recommend the best running shoes for your biomechanics to prevent injury."),
        ActivityFacts("Follow a Plan",
            "Consider following a running plan or program for beginners to ensure you ramp up your training safely and effectively."),
        ActivityFacts("Give Your Body A Break",
            "Be sure to take adequate rest days or opt for low-impact exercise on alternate days to reduce the impact and stress on your body as you build strength."),
      ]),
      Activity(1, 0xe1d2, "Cycling", "assets/images/cycling.jpeg", [
        ActivityFacts("Benefits",
            "Increased cardiovascular fitness, increased muscle strength and flexibility, improved joint mobility, decreased stress levels, improved posture and coordination, strengthened bones, decreased body fat levels, prevention or management of disease and reduced anxiety and depression."),
        ActivityFacts("Choose Right Bike",
            "Not sure what style of bike you want? In short, an endurance focused road bike will suit most beginners. A cyclocross, adventure road or gravel bike may be up your street if you want to travel off road, and a hybrid bike could be an option should drop handlebars feel intimidating (though we'd encourage you to test ride a road bike first). If you're getting into bike riding with the goal of racing, look for an aluminium race bike like the Cannondale CAAD or Specialized Allez."),
        ActivityFacts("Get Geared Up",
            "Cycling can, at first, appear to be a rather expensive hobby. And it can become so, but it doesn't need to be. You don't need to splash out on a wardrobe that would suit a cast member of the Power Rangers movie to be comfortable. Items we would advise you invest in are: Helmet, Lock (if you plan to leave the bike anywhere), Bike lights, Gloves (in winter), Padded cycling shorts (or tights in winter), a base layer, jersey and quality waterproof jacket, Shoes and pedals, Track pump (for use at home), mini pump, puncture repair kit"),
        ActivityFacts("Don't put up with saddle discomfort",
            "Saddle discomfort is very common, and as a result there's a huge selection of saddle styles and designs to choose from - so listen to your body, work out where the problem area is, and look for a retailer with a test ride service to save you wasting cash on failed solutions."),
        ActivityFacts("Practice some basic techniques",
            "You don't need to go from zero to careering down the side of Alpine mountains at speed. But a few basic skills will help you to feel more confident.\nRemember that your front brake is much more effective at stopping you, so get used to feathering it lightly alongside the rear, rather than grabbing a handful of lever.\nWhen cornering, be sure to slow down to an appropriate speed before you hit the bend, this saves you braking on it. Lift up your inside knee and apply weight to the outside to maintain balance.\nWhen approaching a climb, keep pedalling to help carry as much momentum as possible into the ascent and get out of the saddle regularly to stay comfy."),
        ActivityFacts("Eat and drink as you ride",
            "If you're riding for more than 90 minutes, take a snack such as a cereal bar, and aim to eat something every hour. Cyclists usually carry water in a bottle mounted on the frame. Extracting the bottle to drink as you pedal takes practice, but it's worth it."),
        ActivityFacts("(Eventually) Find a Group",
            "From the outside, a cycling club might look like a mass of confident, intimidating lycra clad experts. But a good cycling club will welcome you, and be there to help you out with any technical questions, mechanical difficulties or routing conundrums you have."),
      ]),
      Activity(2, 0xe4dc, "Swimming", "assets/images/swimming.jpeg", [
        ActivityFacts("Benefits",
            "Builds endurance, muscle strength and cardiovascular fitness. helps you maintain a healthy weight, healthy heart and lungs. tones muscles and builds strength. provides an all-over body workout, as nearly all of your muscles are used during swimming."),
        ActivityFacts("Full workout body",
            "Swimming uses all the muscles in the body so whether you swim a gentle breaststroke or hammer butterfly, you will get a full body workout. Plus, exercising in water makes your body work harder so 30 minutes in a pool is worth 45 minutes of the same activity on land."),
        ActivityFacts("Great for general wellbeing",
            "ust 30 minutes of swimming three times a week alongside a balanced, healthy diet and lifestyle is one of the best ways to stay fit and healthy and maintain a positive mental outlook. Do it with friends, and it’s even more fun!"),
        ActivityFacts("De-stresses and relax",
            "Whether it’s work stressing you out, the kids being a nightmare, or just life in general, we all get times we just want to SCREAM. Well, help is at hand. Swimming regularly can lower stress levels, reduce anxiety and depression, and improve your sleep patterns. Feeling the mental benefits of swimming takes just a light swim. No lane pounding needed."),
        ActivityFacts("Burn those calories",
            "Swimming is one of the most effective ways to burn calories. A gentle swim can burn over 200 calories in just half an hour, more than double that of walking. And a faster swim would see that chocolate bar gone quicker than if you went running or cycling."),
        ActivityFacts("Lowers the risk of diseases",
            "As well as being a great form of cardiovascular exercise, swimming just 30 minutes a week can help to guard against heart disease, stroke and type 2 diabetes."),
        ActivityFacts("Supports the body",
            "Water supports up to 90 per cent of the body’s weight. So if you sprained an ankle at Monday night football or have a long term injury or illness, swimming is a brilliant way to stay active."),
      ]),
      Activity(3, 0xe5f3, "Tennis", "assets/images/tennis.jpeg", [
        ActivityFacts("Benefits",
            "Increasing aerobic capacities, lowering resting heart rate and blood pressure, improving metabolic function, increasing bone density ,lowering body fat, improving muscle tone, strength and flexibility, increasing reaction times"),
        ActivityFacts("Proper Equipment",
            "You don’t need a lot to begin playing tennis. You just need a racquet and some gym clothes including proper shoes. Any set of gym clothes will work for tennis, so you don’t necessarily need to spend a lot of money. Tennis requires a good amount of footwork, however, so you’ll need to make sure you have a decent pair of tennis shoes. Avoid running shoes as they do not provide the ankle support you’ll need for rapid lateral movement."),
        ActivityFacts("Tennis Instruction",
            "Whether you begin playing as a kid or in your 20’s, 30’s, 40’s or beyond, it’s always best to start with proper tennis instruction. You’ll want to develop good habits from the first day because bad habits can prove difficult to change. You also don’t want to have to spend time backtracking."),
        ActivityFacts("Use a Ball Machine",
            "Once you know the basics of the forehand and backhand stroke, you’ll want to practice, practice, practice. A great way to improve your stroke is by renting a ball machine and simply practice returning the balls. Listen to your instructor and use the ball machine to master what you learn."),
        ActivityFacts("Don’t Go it Alone",
            "Tennis is a great social sport and you can really learn a lot from playing with a partner. Find someone you can play weekly rounds with. Practice with one person gently tossing 25 to 40 balls over the net while the other returns them, then switch. You can also practice hitting the ball back and forth like you would in a game, or try playing a game."),
        ActivityFacts("Play Regularly",
            "This is key to improving in any sport or anything you want to do. Play regularly. Go to your tennis lessons and then play with a partner and practice every week. Your muscles need it for conditioning and muscle memory. Practice the skills you learn and you’ll see yourself improving week after week. A club is a great place to do this. While you’re at it, don’t forget to have fun!"),
      ]),
      Activity(4, 0xe28d, "Gym", "assets/images/gym.jpeg", [
        ActivityFacts("Benefits",
            "Help you control your weight, reduce your risk of heart diseases, help your body manage blood sugar and insulin levels, help you quit smoking, improve your mental health and mood, stregthen your bones and muscle, reduce risk of some cancers and your risk of falls."),
        ActivityFacts("Set realistic goals",
            "It may take some time to get the results you want. It’s vital to break your ultimate goal down in to stages and set lots of smaller goals to keep you motivated along the way."),
        ActivityFacts("Be consistent",
            "Results come through regular and consistent activity. Stick to your programme and avoid frequent stops and starts."),
        ActivityFacts("Too much too soon",
            "Do not increase the amount of exercise you do too soon. Increase what you’re doing by no more than 10% per week."),
        ActivityFacts("Accept feelings of discomfort",
            "When you first start exercising you’ll experience feelings of discomfort such as shortness of breath, sweating and aching muscles after exercising. Don’t worry, this is completely normal and everyone feels like this when they’re first starting out."),
        ActivityFacts("Warm up",
            "Not warming up is a mistake many beginners make. Before any session ensure that you warm up thoroughly and mobilise the areas that you will be using during the workout. Furthermore, failure to warm up properly may increase the risk of injury."),
      ]),
    ];
  }

  static Activity fetchByID(int id) {
    List<Activity> activities = Activity.fetchAll();
    for (var i = 0; i < activities.length; i++) {
      if (activities[i].id == id) {
        return activities[i];
      }
    }
    return activities[0];
  }
}
