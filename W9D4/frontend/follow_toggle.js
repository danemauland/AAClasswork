APIUtil = require("./api_util")

class FollowToggle {
    constructor(el) {
        // debugger
        this.userID = el.dataset.userId;
        this.followState = el.dataset.initialFollowState;
        this.$el = $(el);
        this.render();
        this.handleClick();
    }

    render() {
        if (this.followState === "unfollowed"){
            this.$el.text("Follow!")
            this.$el.attr('disabled', false);
        } else if (this.followState === "followed") {
            this.$el.text("Unfollow!")
            this.$el.attr('disabled', false);
        }
        else {
            this.$el.attr('disabled', true);
        }  //
    }

    handleClick() {
        this.$el.on("click", e => {
            // debugger
            
            e.preventDefault();
            if (this.followState === "unfollowed"){
                //set followstate temporarily to 
                this.followState = "following";
                this.render();
                APIUtil.followUser(this.userID).then(this.toggleFollow.bind(this));
            } else {
                this.followState = "unfollowing";
                this.render();
                APIUtil.unfollowUser(this.userID).then(this.toggleFollow.bind(this));
            }

            //set followState to either followING or unfollowING....

        });
    }
    
    toggleFollow() {
        // this.followState = (this.followState === "unfollowed" ? "followed" : "unfollowed");
        this.followState = this.followState.slice(0,this.followState.length - 3) + "ed";
        this.render();
    };
    
    
}


module.exports = FollowToggle;