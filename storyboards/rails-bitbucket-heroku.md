










Deploying Ruby on Rails from Bitbucket to Heroku
======================

In this screencast we're gonna deploy a Ruby on Rails application from a Bitbucket repository to Heroku using the Codeship.





I've got a simple Ruby on Rails application called [codefish][codefish-repo] which contains some RSpec examples. If you want to follow along these setup steps on your computer, just fork the repository. [move mouse pointer over "fork" button]

![Bitbucket codefish-rails][screenshot-codefish-repo]





We're gonna deploy this application to Heroku using the Codeship.

![Codeship landingpage][screenshot-codefish-landingpage]

Let's sign in to the Codeship with Bitbucket. The Codeship needs access to our Bitbucket repositories to be able to set them up. [scroll slowly] Let's allow access.

![Bitbucket OAuth][screenshot-oauth]

We're back at the Codeship. Now let's create our first project. [click create project button]

![Codeship welcome screen][screenshot-codeship-welcome]





The first step of our project setup is to select Bitbucket as our repository provider.

![Repo provider selection Bitbucket][screenshot-repo-provider-selection]

In the list of my Bitbucket repositories

![Repo selection Bitbucket][screenshot-repo-selection]

I search for my repo "codefish-rails" and select it.

![Repo selection Bitbucket filtered][screenshot-repo-selection-filtered]

Now our repository is connected and we can set up our test commands:

![Codeship welcome screen][screenshot-codeship-technology]

We select "Ruby on Rails" as our framework. This prepopulates the setup commands and the test commands for us.

![Codeship Technology Ruby on Rails][screenshot-codeship-technology-selected]





The Codeship suggests Ruby 1.9.3, but I want to use the same Ruby version as on my computer. When I type `ruby -v` in the terminal, I find out that I use Ruby `2.0.0p195`.

![Ruby Version][screenshot-ruby-version]

So I just copy my Ruby version into the `rvm use` statement and add a hyphen before the patch version.

Let's uncomment the test command `bundle exec rspec` to run our RSpec examples on every build.

![Rails test commands][screenshot-test-commands]





Now let's finish our setup and go to the dashboard.

![Codeship welcome screen][screenshot-codeship-dasboard]





To start our first build, we need to add a push hook to our Bitbucket repository. Let's copy the hook url and follow the link to the service hook settings of our repository. We add a "POST" hook,

![Bitbucket select POST hook][screenshot-select-post-hook]

paste the hook url

![Bitbucket paste hook URL][screenshot-paste-hook-url]

and save the hook.

![Bitbucket hook URL][screenshot-hook-added]

[close Bitbucket tab]





We can trigger a build for our application by pushing to our repository. Let's add the Codeship status image [move mouse over green badge] to the README file.
[add markdown code for image to editor]

![Codeship welcome screen][screenshot-codeship-image]

Now let's commit and push this change.

![Bitbucket Push][screenshot-codeship-push]

This triggered a new build on the Codeship.

![Codeship running build][screenshot-first-build-running]

We can access the build details by clicking the arrow on the right. Here we can follow the running build.

![Codeship running build details][screenshot-first-build-running-details]

By the way, if you ever need help, check out the Codeship documentation. [move mouse over documentation link] If you encounter any problems, contact the Codeship crew by clicking on the support links in the top-right or the bottom-right corner. [move mouse over support links]

And a few seconds later our build succeeded! Great!

![Codeship finished build][screenshot-first-build-finished]

We see all the commands that were run. After a few initial preparation commands the Codeship ran the commands that we specified a few moments ago.





We can inspect the output of a single command by clicking on it.
[click on test command]
So we can see that two RSpec examples were run

![Codeship build log][screenshot-build-log]

[click on test command again to close log]

![Codeship finished build][screenshot-first-build-finished]





We've already pushed to our repository, watched our build log and got a green build. So we can finish this assistant.

[click on road to success finish button]

![Codeship build without road to success][screenshot-build-without-road-to-success]





Now let's deploy our application to Heroku. We go to our project settings by clicking on the settings icon in the projects dropdown.

![Codeship go to project settings][screenshot-go-to-project-settings]

![Codeship project settings][screenshot-project-settings]

And then to the "Deployment" section.

![Codeship deployment settings][screenshot-deployment-settings]

We want to deploy to "Heroku".

![New Heroku deployment][screenshot-new-heroku-deployment]





Now we need to enter the name of our Heroku application and our API key. Let's go to Heroku and create an application.

![Heroku apps][screenshot-heroku-apps]

I name my application "codefish-rails"

![Create Heroku app][screenshot-create-heroku-app]

and create it.

![Heroku app created][screenshot-heroku-app-created]

Back at our deployment configuration I enter the application name "codefish-rails".

![Heroku deployment name entered][screenshot-heroku-deployment-name]

To retrieve my Heroku API key, I follow the link to my Heroku account and click "Show API key".

![Show Heroku API key][screenshot-show-api-key]

I copy it and insert it into my deployment configuration at the Codeship.





![Complete Heroku deployment][screenshot-complete-heroku-deployment]

Now let's save our deployment configuration.

![Saved Heroku deployment][screenshot-saved-heroku-deployment]

From now on the Codeship will deploy our application to Heroku everytime we push to our Bitbucket repository. Now let's push a change and see if it gets deployed. I add a paragraph "I just deployed my Ruby on Rails app with the Codeship." to the landing page.

![Added Paragraph][screenshot-added-paragraph]

I commit and push the change

![Commit and push paragraph][screenshot-commit-and-push-paragraph]

and immediately another build starts running on the Codeship. Let's go back to our project overview. I will fast-forward until the build is finished.

![Deploy build started][screenshot-deploy-build-started]

After the commands we already know from our first build, our application also gets deployed to Heroku now.

![Build Deployment][screenshot-build-deployment]

And about 2 minutes later our application is online.

![Build Deployment Complete][screenshot-build-deployment-complete]

When we open [codefish-rails.herokuapp.com][codefish-rails-live] now, our deployed application appears.

![Deployed Application][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or tweet us at [codeship][codeship-twitter]!

![Build Deployment Complete][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://bitbucket.org/codeship-tutorials/codefish-rails
 
 [codefish-rails-live]: http://codefish-rails.herokuapp.com
 [screenshot-codefish-repo]: ../screenshots/bitbucket/rails/repository.png
 [screenshot-codefish-landingpage]: ../screenshots/codeship-landingpage.png
 [screenshot-oauth]: ../screenshots/bitbucket/oauth.png
 [screenshot-codeship-welcome]: ../screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: ../screenshots/bitbucket/repo-provider-selection.png
 [screenshot-repo-selection]: ../screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: ../screenshots/rails/repo-selection-filtered.png
 [screenshot-codeship-technology]: ../screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: ../screenshots/rails/codeship-technology.png
 [screenshot-ruby-version]: ../screenshots/rails/ruby-version.png
 [screenshot-test-commands]: ../screenshots/rails/test-commands.png
 [screenshot-codeship-dasboard]: ../screenshots/bitbucket/rails/codeship-dashboard.png
 [screenshot-codeship-image]: ../screenshots/rails/codeship-image.png
 [screenshot-codeship-push]: ../screenshots/bitbucket/rails/push.png
 [screenshot-first-build-running]: ../screenshots/rails/first-build-running.png
 [screenshot-first-build-running-details]: ../screenshots/bitbucket/rails/first-build-running-details.png
 [screenshot-first-build-finished]: ../screenshots/bitbucket/rails/first-build-finished.png
 [screenshot-build-log]: ../screenshots/bitbucket/rails/build-log.png
 [screenshot-build-without-road-to-success]: ../screenshots/bitbucket/rails/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: ../screenshots/bitbucket/rails/go-to-project-settings.png
 [screenshot-project-settings]: ../screenshots/rails/project-settings.png
 [screenshot-deployment-settings]: ../screenshots/rails/deployment-settings.png
 [screenshot-new-heroku-deployment]: ../screenshots/rails/heroku/new-deployment.png
 [screenshot-heroku-apps]: ../screenshots/heroku/heroku-apps.png
 [screenshot-create-heroku-app]: ../screenshots/heroku/create-heroku-app.png
 [screenshot-heroku-app-created]: ../screenshots/heroku/heroku-app-created.png
 [screenshot-heroku-deployment-name]: ../screenshots/rails/heroku/heroku-deployment-name.png
 [screenshot-show-api-key]: ../screenshots/heroku/show-api-key.png
 [screenshot-complete-heroku-deployment]: ../screenshots/rails/heroku/complete-deployment.png
 [screenshot-saved-heroku-deployment]: ../screenshots/rails/heroku/saved-deployment.png
 [screenshot-added-paragraph]: ../screenshots/rails/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: ../screenshots/bitbucket/rails/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: ../screenshots/rails/deploy-build-started.png
 [screenshot-build-deployment]: ../screenshots/rails/heroku/build-deployment.png
 [screenshot-build-deployment-complete]: ../screenshots/rails/heroku/build-deployment-complete.png
 [screenshot-deployed-application]: ../screenshots/rails/heroku/deployed-application.png
 [screenshot-select-post-hook]: ../screenshots/bitbucket/rails/select-post-hook.png
 [screenshot-paste-hook-url]: ../screenshots/bitbucket/rails/paste-hook-url.png
 [screenshot-hook-added]: ../screenshots/bitbucket/rails/hook-added.png

