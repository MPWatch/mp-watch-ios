# MP Watch 🇬🇧 👀

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/b5miRCH.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## User Stories

🎉 The following functionality is completed: 🎉

- [X] Topic timelines - displays tweets for each topic
    - [X] Pulls tweets from topic API endpoint
- [X] Topic bar - displays all topics in horizontally-scrolling bar
    - [X] Dynamically size button based on title
    - [X] Pulls topics from topics API endpoint
    - [X] Bold current topic
- [X] Tweet cell
    - [X] Displays a tweet's age, author, content
    - [X] Specially format hashtags, links, and mentions

🚫 The following functionality is under construction: 🔨

- [ ] Topic bar UI improvements
    - [ ] Add underline, animation for selected topic
- [ ] Movement betweent topics
    - [ ] Use gesture recognizers to change topic choice
    - [ ] Use swipe menu to change topic
- [ ] Add search bar
    - [ ] Given MP name, pulls tweets from MP endpoint
    - [ ] Displays tweets in topic sections
- [ ] Add activitity indicator for TableViews
- [ ] Add loading HUD for initial load
- [ ] Tweet cell
    - [ ] Add action support for mentions, hashtags, links
    - [ ] Add favorite and retweet count
- [ ] Add refresh
- [ ] Add infinite scroll for topic tweets
