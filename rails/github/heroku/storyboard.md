Deploying Rails from GitHub to Heroku
======================

In this screencast we're gonna deploy a Ruby on Rails application from a GitHub repository to Heroku using the Codeship.

I've got a simple Ruby on Rails application called [codefish](https://github.com/codeship-tutorials/codefish-rails) which contains some RSpec examples.

![GitHub codefish-rails](../screenshots/codefish-rails.png)

We're gonna deploy this application to Heroku using the Codeship.

![Codeship landingpage](../../../screenshots/codeship-landingpage.png)

Let's sign in to the Codeship with GitHub:

![GitHub OAuth](../screenshots/oauth.png)

The Codeship needs access to our GitHub repositories to be able to set them up. Let's allow access.

We're back at the Codeship. Now let's create our first project.

![Codeship welcome screen](../../../screenshots/codeship-welcome.png)

I select GitHub as our repository provider.

![Repo provider selection GitHub](../screenshots/repo-provider-selection.png)

In the list of my GitHub repositories

![Repo selection GitHub](../screenshots/repo-selection.png)

I search for my repo "codefish-rails" and select it.

![Repo selection GitHub filtered](../screenshots/repo-selection-filtered.png)

Now our repository is connected and we can set up our test commands:

![Codeship welcome screen](../../../screenshots/codeship-technology.png)

We select "Ruby on Rails" as our framework. This prepopulates the setup commands and the test commands for us.

On my computer I use Ruby 2.0.0 for our application. [enter `rvm list` in Terminal]

![Ruby Version.Png](../../screenshots/ruby-version.png.png)

The Codeship suggests Ruby 1.9.3 by default, but we can use Ruby 2.0 by changing the `rvm use` command.

Let's uncomment the test command `bundle exec rspec` to run our RSpec examples on every build.

![Rails test commands](../screenshots/test-commands.png)

Now let's finish our setup and go to the dashboard.

![Codeship welcome screen](../../../screenshots/codeship-dashboard.png)

We can trigger a build for our application by pushing to our repository. Let's add the Codeship status image to the README file.

![Codeship welcome screen](../../screenshots/codeship-image.png)

Now let's commit and push this change.

![GitHub Push](../screenshots/push.png)

This triggered a new build on the Codeship.

![Codeship running build](../screenshots/first-build-running.png)

We can access the build details by clicking the arrow on the right. Here we can follow the running build.

![Codeship running build details](../screenshots/first-build-running-details.png)

And a few seconds later our build succeeded! Great!

![Codeship finished build](../screenshots/first-build-finished.png)

We see all the commands that were run. After a few initial preparation commands the Codeship ran the commands that we specified a few moments ago.

We can inspect the output of a single command by clicking on it.
[click on RSpec command]
So we can see that two RSpec examples were run

![Codeship build log](../screenshots/build-log.png)

[click on RSpec command again to close log]

![Codeship finished build](../screenshots/first-build-finished.png)

We've already pushed to our repository, watched our build log and got a green build. So we can finish this assistent.

[click on road to success finish button]

![Codeship build without road to success](../screenshots/build-without-road-to-success.png)

Now let's deploy our application to Heroku. We go to our project settings

![Codeship go to project settings](../screenshots/go-to-project-settings.png)

![Codeship project settings](../screenshots/project-settings.png)

and then to the "Deployment" section.

![Codeship deployment settings](../screenshots/deployment-settings.png)

We want to deploy to "Heroku".

![New heroku deployment](screenshots/new-heroku-deployment.png)

Now we need to enter the name of our Heroku application and our API key. Let's go to Heroku and create an application.

![Heroku apps](screenshots/heroku-apps.png)

I name my application "codefish-rails"

![Create Heroku app](screenshots/create-heroku-app.png)

and create it.

![Heroku app created](screenshots/heroku-app-created.png)

Back at our deployment configuration I enter the application name "codefish-rails".

![Heroku deployment name entered](screenshots/heroku-deployment-name.png)

To retrieve my Heroku API key, I follow the link to my Heroku account and click "Show API key".

![Show Heroku API key](screenshots/show-api-key.png)

I copy it and insert it into my deployment configuration at the Codeship.

![Complete Heroku deployment](screenshots/complete-heroku-deployment.png)

Now let's save our deployment configuration.

![Saved Heroku deployment](screenshots/saved-heroku-deployment.png)

The Codeship will deploy our application to Heroku the next time we push to our GitHub repository. Let's add a paragraph "And I set it up in 2 minutes" to our template.

![Added Paragraph](screenshots/added-paragraph.png)

I commit and push the change

![Commit and push paragraph](../screenshots/commit-and-push-paragraph.png)

and immediately another build starts running on the Codeship.

![Deploy build started](../screenshots/deploy-build-started.png)

After the commands that already ran in our first build, our application is deployed to Heroku

![Build Deployment](screenshots/build-deployment.png)

And about 2 minutes later our application is online.

![Build Deployment Complete](screenshots/build-deployment-complete.png)

When we open http://codefish-rails.herokuapp.com/ now, our deployed application appears.

![Deployed Application](screenshots/deployed-application.png)

If you need help with setting up your own application, please use the support link in the top-right corner or tweet us!

![Build Deployment Complete](screenshots/build-deployment-complete.png)
