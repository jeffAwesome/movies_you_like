/*http://d3gtl9l2a4fn1j.cloudfront.net/t/p/ */

(function( myMovieRec, $, undefined ) {

    "use strict";

    myMovieRec.getQueryParam = function(param) {
        var result =  window.location.search.match(
            new RegExp("(\\?|&)" + param + "(\\[\\])?=([^&]*)")
        );
        return result ? result[3] : false; 


    };  // grab the query string portion



    /* Step #1 User enters the name of a movie they like
    ** It will return a list of possible movies the user meant in json data format
    ** If the Json data is returned it will grab the "best result" movie...
    ** and pass that id to the related movie function..... 
    ** If no results are found it will fail with a message
    */
    myMovieRec.initMovieData = function() {
        var term = myMovieRec.getQueryParam('search');
        var enMovie = encodeURIComponent(term);
         $.ajax({
            type: 'GET',
            url: 'http://api.themoviedb.org/3/search/movie?api_key=8e7c67585fa149a56537b63fe68776ae&query='+enMovie+'',
            dataType: 'json',
            success: function(data) {
                if (data.total_results === 0) {
                    myMovieRec.renderNoResults();
                } else {
                    myMovieRec.shortOverviewMovieData(data.results[0].id);

                    if (data.total_results > 1) {
                        myMovieRec.renderNotWhatYouMeant(data);
                    }
                }

            }
        }); // END OF AJAX CALL
    };


    /* Step #2 Will pull json data on the "best result" movie id.
    ** It will call a template function laying out a short image and overview of the movie...
    ** It will call another logic function grabbing related movies
    */
    myMovieRec.shortOverviewMovieData = function(movieId) {
        $.ajax({
            type: 'GET',
            url: 'http://api.themoviedb.org/3/movie/'+movieId+'?api_key=8e7c67585fa149a56537b63fe68776ae&language=en',
            dataType: 'json',
            success: function(data) {
               myMovieRec.renderShortDescript(data);
               myMovieRec.relatedMovies(movieId);
            }
        }); // END OF AJAX CALL

    };

    myMovieRec.relatedMovies = function(movieId) {
         $.ajax({
             type: 'GET',
             url: 'http://api.themoviedb.org/3/movie/'+movieId+'/similar_movies?api_key=8e7c67585fa149a56537b63fe68776ae&language=en',
             dataType: 'json',
             success: function(data) {
                 myMovieRec.renderRelatedMovies(data);
             }
         }); // END OF AJAX CALL 
    };


    myMovieRec.movieViewData = function() {
        var movieId = myMovieRec.getQueryParam('movieID');
        $.ajax({
            type: 'GET',
            url: 'http://api.themoviedb.org/3/movie/'+movieId+'?api_key=8e7c67585fa149a56537b63fe68776ae&language=en',
            dataType: 'json',
            success: function(data) {
               myMovieRec.renderMovieView(data);
               myMovieRec.castMovieData(movieId);
            }
        }); // END OF AJAX CALL
    };

    myMovieRec.castMovieData = function(movieId) {
         $.ajax({
            type: 'GET',
            url: 'http://api.themoviedb.org/3/movie/'+movieId+'/casts?api_key=8e7c67585fa149a56537b63fe68776ae',
            dataType: 'json',
            success: function(data) {
                myMovieRec.renderCastView(data);
            }  // end of success function
        }); // END OF AJAX CALL 
    };



    /* TEMPLATE FUNCTIONS */


    myMovieRec.renderShortDescript = function(relatedData) {
        var source   = $("#overview-short-description").html();
        var template = Handlebars.compile(source);
        var context = relatedData;
        var html    = template(context);
        $(".overview-short-description").append(html);
    };

    myMovieRec.renderNoResults = function() {
        var source   = $("#no-results").html();
        var template = Handlebars.compile(source);
        var context = [{"empty": "Whoa, you like some obscure movies... sorry we didn't find any movies for you. Try another search."}];
        var html    = template(context);
        $(".no-results").append(html);
    };

    myMovieRec.renderRelatedMovies = function(relatedData) {
        var source   = $("#related-movies").html();
        var template = Handlebars.compile(source);
        var context = relatedData;
        var html    = template(context);
        $(".related-movies").append(html);
    };

    myMovieRec.renderNotWhatYouMeant = function(otherMovies) {
        console.log("Were in the not what you meant function");
        var source   = $("#not-what-you-meant").html();
        var template = Handlebars.compile(source);
        var context = otherMovies;
        var html    = template(context);
        $(".not-what-you-meant").append(html);
    }; 

    myMovieRec.renderMovieView = function(movieData) {
        var source   = $("#movie-view").html();
        var template = Handlebars.compile(source);
        var context = movieData;
        var html    = template(context);
        $(".movie-view").append(html);
    }

    myMovieRec.renderCastView = function(castData) {
        var source   = $("#movie-cast-view").html();
        var template = Handlebars.compile(source);
        var context = castData;
        var html    = template(context);
        $(".cast-members").append(html);
    }



}( window.myMovieRec = window.myMovieRec || {}, jQuery ));  // balls on the inside like crockford would have wanted :) http://youtu.be/eGArABpLy0k?t=1m20s */


