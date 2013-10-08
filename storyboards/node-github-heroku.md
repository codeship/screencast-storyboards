










Deploying Node.js from GitHub to Heroku
======================

In this screencast we're gonna deploy a Node.js application from a GitHub repository to Heroku using the Codeship.





I've got a simple Node.js application called [codefish][codefish-repo] which contains some Jasmine specs. If you want to follow along these setup steps on your computer, just fork the repository. [move mouse pointer over "fork" button]

![GitHub codefish-node][screenshot-codefish-repo]





We're gonna deploy this application to Heroku using the Codeship.

![Codeship landingpage][screenshot-codefish-landingpage]

Let's sign in to the Codeship with GitHub. The Codeship needs access to our GitHub repositories to be able to set them up. [scroll slowly] Let's allow access.

![GitHub OAuth][screenshot-oauth]

We're back at the Codeship. Now let's create our first project. [click create project button]

![Codeship welcome screen][screenshot-codeship-welcome]





The first step of our project setup is to select GitHub as our repository provider.

![Repo provider selection GitHub][screenshot-repo-provider-selection]

In the list of my GitHub repositories

![Repo selection GitHub][screenshot-repo-selection]

I search for my repo "codefish-node" and select it.

![Repo selection GitHub filtered][screenshot-repo-selection-filtered]

Now our repository is connected and we can set up our test commands:

![Codeship welcome screen][screenshot-codeship-technology]

We select "Node.js" as our framework. This prepopulates the setup commands and the test commands for us.

![Codeship Technology Node.js][screenshot-codeship-technology-selected]





The Codeship suggests Node.js 0.10.18, but I want to use the same Node version as on my computer. When I type `node -v` in the terminal, I find out that I use Node `0.10.15`.

![Node Version][screenshot-technology-version]

So I just copy my Node version into the `nvm install` and `nvm use` statements.

Additionally to my node modules, I need to install `jasmine-node` globally to be able to run my Jasmine specs. [add `npm install -g jasmine-node` after `npm install`]

I don't need `npm test` for my Jasmine specs, so I comment it. Instead, I want to run `jasmine-node spec`. [add `jasmine-node spec` after commented `npm test`]

![Node.js test commands][screenshot-test-commands]





Now let's finish our setup and go to the dashboard.

![Codeship welcome screen][screenshot-codeship-dasboard]





We can trigger a build for our application by pushing to our repository. Let's add the Codeship status image [move mouse over green badge] to the README file.
[add markdown code for image to editor]

![Codeship welcome screen][screenshot-codeship-image]

Now let's commit and push this change.

![GitHub Push][screenshot-codeship-push]

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
So we can see that two Jasmine specs were run

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

I name my application "codefish-app"

![Create Heroku app][screenshot-create-heroku-app]

and create it.

![Heroku app created][screenshot-heroku-app-created]

Back at our deployment configuration I enter the application name "codefish-app".

![Heroku deployment name entered][screenshot-heroku-deployment-name]

To retrieve my Heroku API key, I follow the link to my Heroku account and click "Show API key".

![Show Heroku API key][screenshot-show-api-key]

I copy it and insert it into my deployment configuration at the Codeship.





![Complete Heroku deployment][screenshot-complete-heroku-deployment]

Now let's save our deployment configuration.

![Saved Heroku deployment][screenshot-saved-heroku-deployment]

From now on the Codeship will deploy our application to Heroku everytime we push to our GitHub repository. Now let's push a change and see if it gets deployed. I add a paragraph "I just deployed my Node.js app with the Codeship." to the landing page.

![Added Paragraph][screenshot-added-paragraph]

I commit and push the change

![Commit and push paragraph][screenshot-commit-and-push-paragraph]

and immediately another build starts running on the Codeship. Let's go back to our project overview. I will fast-forward until the build is finished.

![Deploy build started][screenshot-deploy-build-started]

After the commands we already know from our first build, our application also gets deployed to Heroku now.

![Build Deployment][screenshot-build-deployment]

And about 2 minutes later our application is online.

![Build Deployment Complete][screenshot-build-deployment-complete]

When we open [codefish-app.herokuapp.com][codefish-live] now, our deployed application appears.

![Deployed Application][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or tweet us at [codeship][codeship-twitter]!

![Build Deployment Complete][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://github.com/codeship-tutorials/codefish-node
 
 [codefish-live]: http://codefish-app.herokuapp.com
 [screenshot-codefish-repo]: ../screenshots/github/node/repository.png
 [screenshot-codefish-landingpage]: ../screenshots/codeship-landingpage.png
 [screenshot-oauth]: ../screenshots/github/oauth.png
 [screenshot-codeship-welcome]: ../screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: ../screenshots/github/repo-provider-selection.png
 [screenshot-repo-selection]: ../screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: ../screenshots/node/repo-selection-filtered.png
 [screenshot-codeship-technology]: ../screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: ../screenshots/node/codeship-technology.png
 [screenshot-technology-version]: ../screenshots/node/technology-version.png
 [screenshot-test-commands]: ../screenshots/node/test-commands.png
 [screenshot-codeship-dasboard]: ../screenshots/github/node/codeship-dashboard.png
 [screenshot-codeship-image]: ../screenshots/node/codeship-image.png
 [screenshot-codeship-push]: ../screenshots/github/node/push.png
 [screenshot-first-build-running]: ../screenshots/node/first-build-running.png
 [screenshot-first-build-running-details]: ../screenshots/github/node/first-build-running-details.png
 [screenshot-first-build-finished]: ../screenshots/github/node/first-build-finished.png
 [screenshot-build-log]: ../screenshots/github/node/build-log.png
 [screenshot-build-without-road-to-success]: ../screenshots/github/node/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: ../screenshots/github/node/go-to-project-settings.png
 [screenshot-project-settings]: ../screenshots/node/project-settings.png
 [screenshot-deployment-settings]: ../screenshots/node/deployment-settings.png
 [screenshot-new-heroku-deployment]: ../screenshots/node/heroku/new-deployment.png
 [screenshot-heroku-apps]: ../screenshots/heroku/heroku-apps.png
 [screenshot-create-heroku-app]: ../screenshots/heroku/create-heroku-app.png
 [screenshot-heroku-app-created]: ../screenshots/heroku/heroku-app-created.png
 [screenshot-heroku-deployment-name]: ../screenshots/node/heroku/heroku-deployment-name.png
 [screenshot-show-api-key]: ../screenshots/heroku/show-api-key.png
 [screenshot-complete-heroku-deployment]: ../screenshots/node/heroku/complete-deployment.png
 [screenshot-saved-heroku-deployment]: ../screenshots/node/heroku/saved-deployment.png
 [screenshot-added-paragraph]: ../screenshots/node/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: ../screenshots/github/node/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: ../screenshots/node/deploy-build-started.png
 [screenshot-build-deployment]: ../screenshots/node/heroku/build-deployment.png
 [screenshot-build-deployment-complete]: ../screenshots/node/heroku/build-deployment-complete.png
 [screenshot-deployed-application]: ../screenshots/node/heroku/deployed-application.png
 [screenshot-select-post-hook]: ../screenshots/github/node/select-post-hook.png
 [screenshot-paste-hook-url]: ../screenshots/github/node/paste-hook-url.png
 [screenshot-hook-added]: ../screenshots/github/node/hook-added.png

