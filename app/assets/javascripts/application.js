// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// You probably don't want to use globals, but this is just example code
  var fbAppId = ENV[:FACEBOOK_APP_ID];
  var objectToLike = 'http://www.budgetbytes.com/2011/02/quick-curried-chick-peas/';

  // This check is just here to make sure you set your app ID. You don't
  // need to use it in production. 
  if (fbAppId === ENV[:FACEBOOK_APP_ID]) {
    alert('Please set the fbAppId in the sample.');
  }

  /*
   * This is boilerplate code that is used to initialize
   * the Facebook JS SDK.  You would normally set your
   * App ID in this code.
   */

  // Additional JS functions here
  window.fbAsyncInit = function() {
    FB.init({
      appId      : fbAppId, // App ID
      status     : true,    // check login status
      cookie     : true,    // enable cookies to allow the
                            // server to access the session
      xfbml      : true     // parse page for xfbml or html5
                            // social plugins like login button below
    });

    // Put additional init code here
  };

  // Load the SDK Asynchronously
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/all.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

  /*
   * This function makes a call to the og.likes API.  The
   * object argument is the object you like.  Other types
   * of APIs may take other arguments. (i.e. the book.reads
   * API takes a book= argument.)
   *
   * Because it's a sample, it also sets the privacy
   * parameter so that it will create a story that only you
   * can see.  Remove the privacy parameter and the story
   * will be visible to whatever the default privacy was when
   * you added the app.
   *
   * Also note that you can view any story with the id, as
   * demonstrated with the code below.
   *
   * APIs used in postLike():
   * Call the Graph API from JS:
   *   https://developers.facebook.com/docs/reference/javascript/FB.api
   * The Open Graph og.likes API:
   *   https://developers.facebook.com/docs/reference/opengraph/action-type/og.likes
   * Privacy argument:
   *   https://developers.facebook.com/docs/reference/api/privacy-parameter
   */

  function postLike() {
    FB.api(
       'https://graph.facebook.com/me/og.likes',
       'post',
       { object: objectToLike,
         privacy: {'value': 'SELF'} },
       function(response) {
         if (!response) {
           alert('Error occurred.');
         } else if (response.error) {
           document.getElementById('result').innerHTML =
             'Error: ' + response.error.message;
         } else {
           document.getElementById('result').innerHTML =
             '<a href=\"https://www.facebook.com/me/activity/' +
             response.id + '\">' +
             'Story created.  ID is ' +
             response.id + '</a>';
         }
       }
    );
  }