












<iframe src="" height="498" width="885" allowfullscreen="" frameborder="0"></iframe>

How to set up Continuous Integration and Continuous Deployment for a Ruby on Rails Application from Bitbucket to Heroku
======================

In this blog post we're going to deploy a Ruby on Rails application from a Bitbucket repository to Heroku using [Codeship][codeship].





We've set up a simple Ruby on Rails application called [codefish][codefish-repo] which contains some RSpec examples. We'll use screenshots of this application in this blog post. If you haven't got your own project to set up but you want to follow along on your computer, just fork the repository.

[![codefish-rails on Bitbucket][screenshot-repository]][screenshot-repository]





Together, we're going to deploy this application to Heroku using Codeship.

[![Codeship Landing Page][screenshot-codefish-landingpage]][screenshot-codefish-landingpage]

First, sign in to Codeship with Bitbucket. Codeship needs access to your Bitbucket repositories to be able to set them up. Let's allow access.

[![Bitbucket Access][screenshot-oauth]][screenshot-oauth]

We're back at Codeship. Now let's create your first project.

[![Let's set up our first project on Codeship][screenshot-codeship-welcome]][screenshot-codeship-welcome]





The first step of your project setup is to select Bitbucket as your repository provider.

[![Select your repository provider][screenshot-repo-provider-selection]][screenshot-repo-provider-selection]

In the list of your Bitbucket repositories

[![Search for your repository in the list][screenshot-repo-selection]][screenshot-repo-selection]

search for the repository you want to set up and select it. In my case I search for "codefish".

[![Find your repository in the filtered list][screenshot-repo-selection-filtered]][screenshot-repo-selection-filtered]

Now your repository is connected and you can set up your test commands:

[![Set up your test commands][screenshot-codeship-technology]][screenshot-codeship-technology]

Codefish is a Ruby on Rails application. Therefore let's choose "Ruby on Rails" as your technology. This prepopulates the setup commands and the test commands for you.

[![Select Ruby on Rails as your technology][screenshot-codeship-technology-selected]][screenshot-codeship-technology-selected]





Codeship suggests Ruby 1.9.3, but you can use whatever Ruby version you like. To find out the Ruby version of your project, type `ruby -v` in the Terminal.

[![Type ruby -v and find out your Ruby version][screenshot-technology-version]][screenshot-technology-version]

Just copy your Ruby version into the `rvm use` statement and add a hyphen before the patch version.

By deleting the hash key you can uncomment the test command `bundle exec rspec` to run your RSpec examples on every build.

[![Uncomment the test command `bundle exec rspec`][screenshot-test-commands]][screenshot-test-commands]





Now let's finish your setup and go to the dashboard.

[![Finish your setup. You are on the Dashboard now][screenshot-codeship-dasboard]][screenshot-codeship-dasboard]





To start your first build, you need to add a push hook to your Bitbucket repository. Copy the hook url and follow the link to the service hook settings of your repository. Add a "POST" hook there,

[![Bitbucket select POST hook][screenshot-select-post-hook]][screenshot-select-post-hook]

paste the hook url

[![Bitbucket paste hook URL][screenshot-paste-hook-url]][screenshot-paste-hook-url]

and save the hook.

[![Bitbucket hook URL][screenshot-hook-added]][screenshot-hook-added]





You can trigger a build for your application by pushing to your repository. Let's add the the Codeship status image to the README file. I use markdown syntax to insert the image.

[![Copy the code for the Codeship status badge to your README file][screenshot-codeship-image]][screenshot-codeship-image]

Now commit and push this change.

[![Commit and push your change][screenshot-codeship-push]][screenshot-codeship-push]

This triggered a new build on Codeship.

[![A new build got triggered on Codeship][screenshot-first-build-running]][screenshot-first-build-running]

You can access the build details by clicking the arrow on the right. Here you can follow the running build.

[![Click on the arrow to the right to access the build details][screenshot-first-build-running-details]][screenshot-first-build-running-details]

A few seconds later your build succeeded! Great!

[![Look at all the commands that are running][screenshot-first-build-finished]][screenshot-first-build-finished]

You see all the commands that were run. After a few initial preparation commands Codeship ran the commands that you specified a few moments ago.





You can inspect the output of a single command by clicking on it. For the `codefish` application, we can see that two RSpec examples were run.

[![Look at the log of a single command by clicking on it][screenshot-build-log]][screenshot-build-log]





You've already pushed to your repository, watched your build log and got a green build. So you can finish the assistant at the top.

[![Finish the setup wizard by clicking on the click to finish button][screenshot-build-without-road-to-success]][screenshot-build-without-road-to-success]





Now let's deploy your application to Heroku. Go to your project settings by clicking on the settings icon in the projects dropdown.

[![Go to your project settings by clicking on the settings icon in the projects dropdown][screenshot-go-to-project-settings]][screenshot-go-to-project-settings]

[![You are on the Testing Setup screen now][screenshot-project-settings]][screenshot-project-settings]

Then navigate to the "Deployment" section.

[![You are on the Deployment Setup screen now][screenshot-deployment-settings]][screenshot-deployment-settings]

As we want to deploy to Heroku we click on the "Heroku" button.

[![Click on the Heroku button][screenshot-new-deployment]][screenshot-new-deployment]





Now you are asked to enter the name of your Heroku application and your API key. If you haven't already, now is the time to go to Heroku and create an application.

[![You are on the Heroku page now][screenshot-heroku-apps]][screenshot-heroku-apps]

I named my application "codefish-app", but please choose whatever name you like

[![Create your app and name it codefish-app][screenshot-create-heroku-app]][screenshot-create-heroku-app]

and create your app.

[![You successfully created your Heroku App][screenshot-heroku-app-created]][screenshot-heroku-app-created]

Back at your deployment configuration on Codeship enter the application name.

[![Back on Codeship we enter the application name codefish-app][screenshot-heroku-deployment-name]][screenshot-heroku-deployment-name]

To retrieve your Heroku API key, follow the link to your Heroku account and click "Show API key".

[![Click on the link to get your Heroku API key][screenshot-show-api-key]][screenshot-show-api-key]

Copy it and insert it into your deployment configuration at Codeship.





[![Copy and paste the Heroku API key to Codeship][screenshot-complete-deployment]][screenshot-complete-deployment]

Now save your deployment by clicking on the green checkmark on the right.

[![Save your deployment configuration by clicking on the green checkmark][screenshot-saved-deployment]][screenshot-saved-deployment]

From now on Codeship will deploy your application to Heroku everytime you push to your Bitbucket repository.





Let's push a change and see if it gets deployed. Change something in your application first,

[![Add a new paragraph you can then commit and push][screenshot-added-paragraph]][screenshot-added-paragraph]

then commit and push the change.

[![Commit and push the change][screenshot-commit-and-push-paragraph]][screenshot-commit-and-push-paragraph]





And immediately another build will start running on Codeship. Let's go back to your project overview.

[![Go back to the project overview to see a new running build][screenshot-deploy-build-started]][screenshot-deploy-build-started]

After the commands we already know from your first build, your application also gets deployed to Heroku now.

[![After some initial commands were run your application gets deployed][screenshot-build-deployment]][screenshot-build-deployment]

And about 2 minutes later your application is online.

[![After about 2 minutes your application is online][screenshot-build-deployment-complete]][screenshot-build-deployment-complete]





When you open the URL of your Heroku app now, your deployed application appears. You can find mine on [codefish-app.herokuapp.com][codefish-live].

[![Have a look at the app you just deployed][screenshot-deployed-application]][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or please tweet us [@codeship][codeship-twitter]!

![If you need help please click the support link in the top-right corner or tweet us @codeship][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://bitbucket.org/codeship-tutorials/codefish-rails
 
 
 [codefish-live]: http://codefish-app.herokuapp.com
 
 [screenshot-repository]: ../screenshots/bitbucket/codefish-rails/repository.png
 [screenshot-codefish-landingpage]: ../screenshots/codeship-landingpage.png
 [screenshot-oauth]: ../screenshots/bitbucket/oauth.png
 [screenshot-codeship-welcome]: ../screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: ../screenshots/bitbucket/repo-provider-selection.png
 [screenshot-repo-selection]: ../screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: ../screenshots/rails/codefish-rails-selection-filtered.png
 [screenshot-codeship-technology]: ../screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: ../screenshots/rails/codeship-technology.png
 [screenshot-technology-version]: ../screenshots/rails/technology-version.png
 [screenshot-test-commands]: ../screenshots/rails/test-commands.png
 [screenshot-codeship-dasboard]: ../screenshots/bitbucket/codefish-rails/codeship-dashboard.png
 [screenshot-codeship-image]: ../screenshots/rails/codeship-image.png
 [screenshot-codeship-push]: ../screenshots/bitbucket/codefish-rails/push.png
 [screenshot-first-build-running]: ../screenshots/rails/first-build-running.png
 [screenshot-first-build-running-details]: ../screenshots/bitbucket/codefish-rails/first-build-running-details.png
 [screenshot-first-build-finished]: ../screenshots/bitbucket/codefish-rails/first-build-finished.png
 [screenshot-build-log]: ../screenshots/bitbucket/codefish-rails/build-log.png
 [screenshot-build-without-road-to-success]: ../screenshots/bitbucket/codefish-rails/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: ../screenshots/bitbucket/codefish-rails/go-to-project-settings.png
 [screenshot-project-settings]: ../screenshots/rails/project-settings.png
 [screenshot-deployment-settings]: ../screenshots/rails/deployment-settings.png
 [screenshot-new-deployment]: ../screenshots/rails/heroku/new-deployment.png
 [screenshot-heroku-apps]: ../screenshots/heroku/heroku-apps.png
 [screenshot-create-heroku-app]: ../screenshots/heroku/create-heroku-app.png
 [screenshot-heroku-app-created]: ../screenshots/heroku/heroku-app-created.png
 [screenshot-heroku-deployment-name]: ../screenshots/rails/heroku/heroku-deployment-name.png
 [screenshot-show-api-key]: ../screenshots/heroku/show-api-key.png
 [screenshot-complete-deployment]: ../screenshots/rails/heroku/complete-deployment.png
 [screenshot-saved-deployment]: ../screenshots/rails/heroku/saved-deployment.png
 [screenshot-added-paragraph]: ../screenshots/rails/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: ../screenshots/bitbucket/rails/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: ../screenshots/rails/heroku/deploy-build-started.png
 [screenshot-build-deployment]: ../screenshots/rails/heroku/build-deployment.png
 [screenshot-build-deployment-complete]: ../screenshots/rails/heroku/build-deployment-complete.png
 [screenshot-deployed-application]: ../screenshots/rails/heroku/deployed-application.png
 [screenshot-select-post-hook]: ../screenshots/bitbucket/codefish-rails/select-post-hook.png
 [screenshot-paste-hook-url]: ../screenshots/bitbucket/codefish-rails/paste-hook-url.png
 [screenshot-hook-added]: ../screenshots/bitbucket/codefish-rails/hook-added.png
 [screenshot-deployment-username]: ../screenshots/rails/heroku/username.png
 [screenshot-create-deployment-token]: ../screenshots/rails/heroku/create-token.png
 [screenshot-add-deployment-config]: ../screenshots/heroku/add-config.png
 [screenshot-commit-and-push-deployment-config]: ../screenshots/bitbucket/codefish-rails/heroku/commit-and-push-deployment-config.png
 [screenshot-dotcloud-api-key]: ../screenshots/heroku/api-key.png
 [screenshot-dotcloud-deployment-api-key]: ../screenshots/rails/heroku/deployment-api-key.png
 [screenshot-dotcloud-yml]: ../screenshots/rails/heroku/dotcloud-yml.png
 [screenshot-dotcloud-wsgi-py]: ../screenshots/rails/heroku/wsgi-py.png
 [screenshot-deployment-documentation-page]: ../screenshots/rails/heroku/documentation-page.png
 [screenshot-empty-deployment]: ../screenshots/rails/heroku/empty-deployment.png
 [screenshot-deployment-home-page]: ../screenshots/heroku/home-page.png
 [screenshot-new-deployment-app]: ../screenshots/rails/heroku/new-deployment-app.png
 [screenshot-deployment-oauth]: ../screenshots/heroku/oauth.png
 [screenshot-app-yml]: ../screenshots/rails/heroku/app-yml.png
 [screenshot-install-tool]: ../screenshots/heroku/install-tool.png
 [screenshot-sign-in-to-deployment]: ../screenshots/heroku/sign-in-to-deployment.png
 [screenshot-create-api-token]: ../screenshots/heroku/create-api-token.png
 [screenshot-insert-api-token]: ../screenshots/heroku/insert-api-token.png
 [screenshot-look-up-url]: ../screenshots/heroku/look-up-url.png

