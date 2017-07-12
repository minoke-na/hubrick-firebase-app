Hubrick Mobile Engineer Challenge
========================
 
We're excited that you're interested in joining the [Hubrick](https://hubrick.com/) team. 
The purpose of this test is to see how you approach problems as well as to evaluate the quality of your code.
 
# Challenge description
The challenge is to create a simple real-time application.
There is a Firebase that sends events. Please subscribe to those events and visualise them.
Events represent feed items. There are 3 types of feed items:
- `ADD`
- `UPDATE`
- `DELETE`
 
`ADD` a feed item should have the following behavior:
- when you are on the top of the screen, please display a new feed card;
- when you scrolled down and the top of the feed list is not visible, please show a visual notification saying you have a new activity. Clicking on the notification smoothly transitions the user to the top of the list where the new feed card should be displayed. Please use a nice animation for the transition;
- when the application is not active, please send a native alert;
 
`UPDATE` feed item should just update the feed card on UI, based on the item id.

`DELETE` feed item should be greyed out.
 
The format of a Firebase event object is the [following](https://github.com/hubrick/mobile-challenge/blob/master/feed-item.json):
```
{
    "type": "ADD",
    "id": "",
    "payload": {
        ...
    }
}
```
Please follow the [design of the feed card](https://github.com/hubrick/mobile-challenge/blob/master/feed-card.png).
 
# Instructions
- Use a language and libraries that are reasonable and  you are most familiar with.
- Feel free to use public [Hubrick Challenge Firebase database](https://hubrick-challenge.firebaseio.com) or create a new one via [firebase console](https://console.firebase.google.com/). You can use [UI](https://plnkr.co/edit/WpJsPOj8rbKlIyrXKwgI?p=preview) for sending new events to Firebase.
- Test coverage is a plus.
 
# What we're looking for:
- Code quality
- Correctness
- Technical choices
 
# Submission
Please push your code to a GitHub repository (or similar) and let us know when it's ready to for review. Please add a readme with instruction how to run the code. We appreciate your time and energy completing the coding exercise and will review your solution as quickly as possible.