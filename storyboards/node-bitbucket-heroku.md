













Deploying Node.js from Bitbucket to Heroku
======================

In this screencast we're going to deploy a Node.js application from a Bitbucket repository to Heroku using Codeship.





I've got a simple Node.js application called [codefish][codefish-repo] which contains some Jasmine specs. If you want to follow along these setup steps on your computer, just fork the repository. [move mouse pointer over "fork" button]

![Bitbucket codefish-node][screenshot-repository]





We're going to deploy this application to Heroku using Codeship.

![Codeship landingpage][screenshot-codefish-landingpage]

Let's sign in to Codeship with Bitbucket. Codeship needs access to our Bitbucket repositories to be able to set them up. [scroll slowly] Let's allow access.

![Bitbucket OAuth][screenshot-oauth]

We're back at Codeship. Now let's create our first project. [click create project button]

![Codeship welcome screen][screenshot-codeship-welcome]





The first step of our project setup is to select Bitbucket as our repository provider.

![Repo provider selection Bitbucket][screenshot-repo-provider-selection]

In the list of my Bitbucket repositories

![Repo selection Bitbucket][screenshot-repo-selection]

I search for my repo "codefish-node" and select it.

![Repo selection Bitbucket filtered][screenshot-repo-selection-filtered]

Now our repository is connected and we can set up our test commands:

![Codeship welcome screen][screenshot-codeship-technology]

We select "Node.js" as our technology. This prepopulates the setup commands and the test commands for us.

![Codeship Technology Node.js][screenshot-codeship-technology-selected]





Codeship suggests Node.js 0.10.25, but I want to use the same Node version as on my computer. When I type `node -v` in the terminal, I find out that I use Node `0.10.26`.

![Node Version][screenshot-technology-version]

So I just copy my Node version into the `nvm install` and `nvm use` statements.

Additionally to my node modules, I need to install `jasmine-node` globally to be able to run my Jasmine specs. [add `npm install -g jasmine-node` after `npm install`]

I don't need `npm test` for my Jasmine specs, so I comment it out. Instead, I want to run `jasmine-node spec`. [add `jasmine-node spec` after commented `npm test`]

![Node.js test commands][screenshot-test-commands]





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

This triggered a new build on Codeship.

![Codeship running build][screenshot-first-build-running]

We can access the build details by clicking the arrow on the right. Here we can follow the running build.

![Codeship running build details][screenshot-first-build-running-details]

By the way, if you ever need help, check out the Codeship documentation. [move mouse over documentation link] If you encounter any problems, contact the Codeship crew by clicking on the support links in the top-right or the bottom-right corner. [move mouse over support links]

A few seconds later our build succeeded! Great!

![Codeship finished build][screenshot-first-build-finished]

We see all the commands that were run. After a few initial preparation commands Codeship ran the commands that we specified a few moments ago.





We can inspect the output of a single command by clicking on it.
[click on test command]
So we can see that two Jasmine specs were run.

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

![New Heroku deployment][screenshot-new-deployment]





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

I copy it and insert it into my deployment configuration at Codeship.





![Complete Heroku deployment][screenshot-complete-deployment]

Now let's save our deployment configuration.

![Saved Heroku deployment][screenshot-saved-deployment]

From now on Codeship will deploy our application to Heroku everytime we push to our Bitbucket repository.
Let's go back to our Dashboard.





Now let's push a change and see if it gets deployed. I add a paragraph "I just deployed my Node.js app with Codeship." to the landing page.

![Added Paragraph][screenshot-added-paragraph]

I commit and push the change

![Commit and push paragraph][screenshot-commit-and-push-paragraph]





and immediately another build starts running on Codeship. I will fast-forward until the build is finished.

![Deploy build started][screenshot-deploy-build-started]

After the commands we already know from our first build, our application also gets deployed to Heroku now.

![Build Deployment][screenshot-build-deployment]

And about 2 minutes later our application is online.

![Build Deployment Complete][screenshot-build-deployment-complete]





When we open [codefish-app.herokuapp.com][codefish-live] now, our deployed application appears.

![Deployed Application][screenshot-deployed-application]

#########RECORD VIDEO FROM HERE

If you need help with setting up your own application, please use the support link in the top-right corner or tweet us at [codeship][codeship-twitter]!

Take a look at all of our other deployment videos and blogposts at blog.codeship.io.
If you want to give Codeship a try click the sign up link that will open right after the video.

Ship long and prosper

![Build Deployment Complete][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://bitbucket.org/codeship-tutorials/codefish-node
 
 
 [codefish-live]: http://codefish-app.herokuapp.com
 
 [screenshot-repository]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/repository.png
 [screenshot-codefish-landingpage]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/codeship-landingpage.png
 [screenshot-oauth]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/oauth.png
 [screenshot-codeship-welcome]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/repo-provider-selection.png
 [screenshot-repo-selection]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/codefish-node-selection-filtered.png
 [screenshot-codeship-technology]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/codeship-technology.png
 [screenshot-technology-version]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/technology-version.png
 [screenshot-test-commands]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/test-commands.png
 [screenshot-codeship-dasboard]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/codeship-dashboard.png
 [screenshot-codeship-image]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/codeship-image.png
 [screenshot-codeship-push]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/push.png
 [screenshot-first-build-running]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/first-build-running.png
 [screenshot-first-build-running-details]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/first-build-running-details.png
 [screenshot-first-build-finished]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/first-build-finished.png
 [screenshot-build-log]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/build-log.png
 [screenshot-build-without-road-to-success]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/go-to-project-settings.png
 [screenshot-project-settings]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/project-settings.png
 [screenshot-deployment-settings]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/deployment-settings.png
 [screenshot-new-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/new-deployment.png
 [screenshot-heroku-apps]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/heroku-apps.png
 [screenshot-create-heroku-app]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/create-heroku-app.png
 [screenshot-heroku-app-created]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/heroku-app-created.png
 [screenshot-heroku-deployment-name]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/heroku-deployment-name.png
 [screenshot-show-api-key]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/show-api-key.png
 [screenshot-complete-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/complete-deployment.png
 [screenshot-saved-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/saved-deployment.png
 [screenshot-added-paragraph]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/node/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/deploy-build-started.png
 [screenshot-build-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/build-deployment.png
 [screenshot-build-deployment-complete]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/build-deployment-complete.png
 [screenshot-deployed-application]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/deployed-application.png
 [screenshot-select-post-hook]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/select-post-hook.png
 [screenshot-paste-hook-url]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/paste-hook-url.png
 [screenshot-hook-added]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/hook-added.png
 [screenshot-deployment-username]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/username.png
 [screenshot-create-deployment-token]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/create-token.png
 [screenshot-add-deployment-config]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/add-config.png
 [screenshot-commit-and-push-deployment-config]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/bitbucket/codefish-node/heroku/commit-and-push-deployment-config.png
 [screenshot-dotcloud-api-key]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/api-key.png
 [screenshot-dotcloud-deployment-api-key]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/deployment-api-key.png
 [screenshot-dotcloud-yml]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/dotcloud-yml.png
 [screenshot-dotcloud-wsgi-py]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/wsgi-py.png
 [screenshot-deployment-documentation-page]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/documentation-page.png
 [screenshot-empty-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/empty-deployment.png
 [screenshot-deployment-home-page]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/home-page.png
 [screenshot-new-deployment-app]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/new-deployment-app.png
 [screenshot-deployment-oauth]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/oauth.png
 [screenshot-app-yml]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/node/heroku/app-yml.png
 [screenshot-install-tool]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/install-tool.png
 [screenshot-sign-in-to-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/sign-in-to-deployment.png
 [screenshot-create-api-token]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/create-api-token.png
 [screenshot-insert-api-token]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/insert-api-token.png
 [screenshot-look-up-url]: https://raw.githubusercontent.com/codeship/screencast-storyboards/node-bitbucket-heroku/screenshots/heroku/look-up-url.png

