/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module */
/***/ ((module) => {

const APIUtil = {
    followUser: id => {
        return $.ajax({
            method: "POST",
            url: `/users/${id}/follow`,
            dataType: 'json'
        });
        
    },
    unfollowUser: id => {
        return $.ajax({
            method: "DELETE",
            url: `/users/${id}/follow`,
            dataType: 'json'
        });
    }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: module, __webpack_require__ */
/*! CommonJS bailout: module.exports is used directly at 57:0-14 */
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js")

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		if(__webpack_module_cache__[moduleId]) {
/******/ 			return __webpack_module_cache__[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! unknown exports (runtime-defined) */
/*! runtime requirements: __webpack_require__ */
const FollowToggle = __webpack_require__(/*! ./follow_toggle.js */ "./frontend/follow_toggle.js");




$(() => {
    $('button.follow-toggle').each( (index, ele) => {
        new FollowToggle(ele);
    });

    
});
})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map