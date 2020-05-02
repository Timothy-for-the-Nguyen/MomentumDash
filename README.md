# MomentumDash

## Deploying to Heroku
1. Create an account. We reccomend using a personal account instead of an organization to deploy your app because personal accounts have free dynos.
2. Connect your GitHub to Heroku under the Deploy tab.
3. Connect your repo to Heroku and hit Deploy Branch.
4. Enable automatic deploys to allow future commits to update on Heroku without manual intervention.
5. Click on the More button on Heroku and open up the console.
6. Type in "bash" and run these commands:
```
rake db:seed
rake db:migrate
```
7. Go to your Heroku app website. Your app should be now be running.

## Configuring Google Sign-In
1. When you first try to use Google Sign-In, you will most likely get a message saying "Error 400: redirect_uri_mismatch. You will need to whitelist your Heroku app domain and set a redirect URI.
2. Create a [Google Developers account](https://console.developers.google.com).
3. Setup a new project and obtain an [API key](https://developers.google.com/identity/sign-in/web/sign-in). You will need to update your app to use this key.
4. Add your Heroku app domain to the list of [authorized domains](https://support.google.com/cloud/answer/6158849?hl=en&authuser=1#authorized-domains).
5. Follow the instructions here to [set a redirect URI](https://developers.google.com/identity/protocols/oauth2/openid-connect#setredirecturi).
6. Your app should work with Google Sign-In after completing these steps. If you are having issues, try using another browser, or check that your browser has cookies enabled. We recommend you to use Google Chrome.

## Setting Up Ruby on Rails with Your Development Environment
1. Clone this repository to your workspace.
2. Navigate to the project directory and run:
```
bundle install --without production
```
3. If you are getting a message saying "Your Ruby version is 2.x.x, but your Gemfile specified 2.x.x," you will need [change your RVM version](https://superuser.com/questions/340490/how-to-install-and-use-different-versions-of-ruby).
4. Run ```rails s``` and open the app in your browser.
5. You should see a bunch of red text. Copy the command on the page and run it to do a database migration.
6. Try running the app again.

## Helpful Tips

* Learn Ruby on Rails before diving into the project. Do your assigned homework early because they are helpful!
* Run [migrations](https://guides.rubyonrails.org/v3.2/migrations.html) with ```rake db:migrate``` whenever you alter your database.
* Learn how to write and run tests.
