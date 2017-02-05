# CivicHelper
@CivicHelper is a Twitter bot created to help connect citizens to elections and their representatives in government.

## Summary
[Christi Reid](https://github.com/limerentfox/) and [Matt Fender] (https://github.com/mjfender/) created the MVP version of this CLI
(command line interface) program in December 2016 as part of our immersive web developer program at Flatiron School in NYC.

The CLI version of the app makes calls to the Twitter API using the [@CivicHelper](https://www.twitter.com/CivicHelper) account to identify
tweets in the United States about certain topics related to civic engagement (voting, elections, etc). 

Next, the program parses through the results to identify tweets with "point" or "place" GPS information and then uses the Google Maps API
(via the geocoder gem) to generate a properly formatted street address. 

Finally, the Google Civic API is called to provide a list of the elected officials for the given address. The twitter handles of four
random elected officials are pulled out of the JSON object and inserted into a tweet directed at the user. For example:

> **@CivicHelper**: @davidcnswanson Elected officials where you tweeted this include: @whitehouse, @GovernorVA, @SenKaineOffice,
> @RalphNortham!

For more information: [@CivicHelper: Between the Lines](https://medium.com/@mattfender/civichelper-between-the-lines-6a1253dda521#.vz1woys5x)

## Technical Details
The CLI app is built with Ruby and makes use of the Google Civic, Twitter and Google Maps APIs and leverages these gems to easily access them:
* google-api-clients
* geocoder
* twitter

## Known Issues
We hoped to host the app on Heroku and run @CivicHelper on a 24/7 basis, helping to connect Americans to their elected officials on
Twitter. Unfortunately, the Twitter API essentially prohibits developers from tweeting at strangers — especially when each tweet tags
the @handles of four elected officials. [#SadTrombone](http://www.sadtrombone.com)

## Future Iterations
In the months following our original presentation of @CivicHelper, we have continued to learn languages and frameworks. We imagine
refactoring and re-envisioning this project in future versions by using Ruby on Rails and Javascript, React and Redux.

Some ideas include:
* Listen only for specific hashtags (ex: #WhereDoIVote, #WhoAreMyElecteds, #WhoRepresentsMe)
* Instead of tagging all elected officials in @CivicHelper's tweet, simply include a link to a user's show page that provides a full list of elected officials at a specific tweet's point or place GPS location
