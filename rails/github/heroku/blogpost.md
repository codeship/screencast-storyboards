How to set up Continuous Integration and Continuous Deployment for a Ruby on Rails Application from GitHub to Heroku
======================

In this blog post we're gonna deploy a Ruby on Rails application from a GitHub repository to Heroku using [the Codeship](https://www.codeship.io/).

We've set up a simple Ruby on Rails application called [codefish](https://github.com/codeship-tutorials/codefish-rails) which contains some RSpec examples. We'll use screenshots of this application in this blog post. If you don't have an own project to set up but you want to follow along on your computer, just fork the repository.

![GitHub codefish-rails](../screenshots/codefish-rails.png)

Together, we're gonna deploy this application to Heroku using the Codeship.

![Codeship landingpage](../../../screenshots/codeship-landingpage.png)

First, sign in to the Codeship with GitHub. The Codeship needs access to your GitHub repositories to be able to set them up. Let's allow access.

![GitHub OAuth](../screenshots/oauth.png)

We're back at the Codeship. Now let's create your first project.

![Codeship welcome screen](../../../screenshots/codeship-welcome.png)

The first step of your project setup is to select GitHub as your repository provider.

![Repo provider selection GitHub](../screenshots/repo-provider-selection.png)

In the list of your GitHub repositories

![Repo selection GitHub](../screenshots/repo-selection.png)

search for the repository you want to set up and select it. In my case I search for "codefish".

![Repo selection GitHub filtered](../screenshots/repo-selection-filtered.png)

Now your repository is connected and you can set up your test commands:

![Codeship welcome screen](../../../screenshots/codeship-technology.png)

Codefish is a Ruby on Rails application. So I choose "Ruby on Rails" as my framework. This prepopulates the setup commands and the test commands for you.

![Codeship Technology Rails](../../screenshots/codeship-technology-rails.png)

The Codeship suggests Ruby 1.9.3, but you can use whatever Ruby version you like. If you're unsure about the Ruby version of your project, type `ruby -v` in the Terminal.

![Ruby Version.Png](../../screenshots/ruby-version.png)

Just copy your Ruby version into the `rvm use` statement and add a hyphen before the patch version.

By deleting the hash key you can uncomment the test command `bundle exec rspec` to run your RSpec examples on every build.

![Rails test commands](../screenshots/test-commands.png)

Now let's finish your setup and go to the dashboard.

![Codeship welcome screen](../../../screenshots/codeship-dashboard.png)

You can trigger a build for your application by pushing to your repository. Let's add the Codeship status image to the README file. I use markdown syntax to insert the image.

![Codeship welcome screen](../../screenshots/codeship-image.png)

Now commit and push this change.

![GitHub Push](../screenshots/push.png)

This triggered a new build on the Codeship.

![Codeship running build](../screenshots/first-build-running.png)

You can access the build details by clicking the arrow on the right. Here you can follow the running build.

![Codeship running build details](../screenshots/first-build-running-details.png)

And a few seconds later your build succeeded! Great!

![Codeship finished build](../screenshots/first-build-finished.png)

You see all the commands that were run. After a few initial preparation commands the Codeship ran the commands that you specified a few moments ago.

You can inspect the output of a single command by clicking on it. For the `codefish` application, we can see that two RSpec examples were run.

![Codeship build log](../screenshots/build-log.png)

You've already pushed to your repository, watched your build log and got a green build. So you can finish the assistant at the top.

![Codeship build without road to success](../screenshots/build-without-road-to-success.png)

Now let's deploy your application to Heroku. Go to your project settings by clicking on the settings icon in the projects dropdown.

![Codeship go to project settings](../screenshots/go-to-project-settings.png)

![Codeship project settings](../screenshots/project-settings.png)

Then navigate to the "Deployment" section.

![Codeship deployment settings](../screenshots/deployment-settings.png)

As we want to deploy to Heroku we click on the "Heroku" button.

![New heroku deployment](screenshots/new-heroku-deployment.png)

Now you are asked to enter the name of your Heroku application and your API key. If you haven't already, now is the time to go to Heroku and create an application.

![Heroku apps](screenshots/heroku-apps.png)

I named my application "codefish-rails", but please choose whatever name you like

![Create Heroku app](screenshots/create-heroku-app.png)

and create your app.

![Heroku app created](screenshots/heroku-app-created.png)

Back at your deployment configuration on the Codeship enter the application name.

![Heroku deployment name entered](screenshots/heroku-deployment-name.png)

To retrieve your Heroku API key, follow the link to your Heroku account and click "Show API key".

![Show Heroku API key](screenshots/show-api-key.png)

Copy it and insert it into your deployment configuration at the Codeship.

![Complete Heroku deployment](screenshots/complete-heroku-deployment.png)

Now save your deployment by clicking on the green checkmark on the right.

![Saved Heroku deployment](screenshots/saved-heroku-deployment.png)

From now on the Codeship will deploy your application to Heroku everytime you push to your GitHub repository. Let's push a change and see if it gets deployed. Change something in your application first,

![Added Paragraph](screenshots/added-paragraph.png)

then commit and push the change.

![Commit and push paragraph](../screenshots/commit-and-push-paragraph.png)

And immediately another build will start running on the Codeship. Let's go back to your project overview.

![Deploy build started](../screenshots/deploy-build-started.png)

After the commands we already know from your first build, your application also gets deployed to Heroku now.

![Build Deployment](screenshots/build-deployment.png)

And about 2 minutes later your application is online.

![Build Deployment Complete](screenshots/build-deployment-complete.png)

When you open the URL of your Heroku app now, your deployed application appears. You can find mine on [codefish-rails.herokuapp.com][http://codefish-rails.herokuapp.com].

![Deployed Application](screenshots/deployed-application.png)

If you need help with setting up your own application, please use the support link in the top-right corner or please tweet us [@codeship](http://www.twitter.com/codeship)!

![Build Deployment Complete](screenshots/build-deployment-complete.png)
