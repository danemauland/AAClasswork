const FollowToggle = require("./follow_toggle.js");




$(() => {
    $('button.follow-toggle').each( (index, ele) => {
        new FollowToggle(ele);
    });

    
});