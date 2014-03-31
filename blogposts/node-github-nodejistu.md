












How to set up Continuous Integration and Continuous Deployment for a Node.js Application from GitHub to Nodejitsu
======================

In this blog post we're going to deploy a Node.js application from a GitHub repository to Nodejitsu using [Codeship][codeship].





We've set up a simple Node.js application called [codefish][codefish-repo] which contains some Jasmine specs. We'll use screenshots of this application in this blog post. If you haven't got your own project to set up but you want to follow along on your computer, just fork the repository.

[![codefish-node on GitHub][screenshot-repository]][screenshot-repository]





Together, we're going to deploy this application to Nodejitsu using Codeship.

[![Codeship Landing Page][screenshot-codefish-landingpage]][screenshot-codefish-landingpage]

First, sign in to Codeship with GitHub. Codeship needs access to your GitHub repositories to be able to set them up. Let's allow access.

[![GitHub Access][screenshot-oauth]][screenshot-oauth]

We're back at Codeship. Now let's create your first project.

[![Let's set up our first project on Codeship][screenshot-codeship-welcome]][screenshot-codeship-welcome]





The first step of your project setup is to select GitHub as your repository provider.

[![Select your repository provider][screenshot-repo-provider-selection]][screenshot-repo-provider-selection]

In the list of your GitHub repositories

[![Search for your repository in the list][screenshot-repo-selection]][screenshot-repo-selection]

search for the repository you want to set up and select it. In my case I search for "codefish".

[![Find your repository in the filtered list][screenshot-repo-selection-filtered]][screenshot-repo-selection-filtered]

Now your repository is connected and you can set up your test commands:

[![Set up your test commands][screenshot-codeship-technology]][screenshot-codeship-technology]

Codefish is a Node.js application. Therefore let's choose "Node.js" as your technology. This prepopulates the setup commands and the test commands for you.

[![Select Node.js as your technology][screenshot-codeship-technology-selected]][screenshot-codeship-technology-selected]





Codeship suggests Node.js 0.10.18, but you can use whatever Node version you like. To find out the Node version of your project, type `node -v` in the Terminal.

[![Type ruby -v and find out your Ruby version][screenshot-technology-version]][screenshot-technology-version]

Just copy your Node version into the `nvm install` and `nvm use` statements.

If you want to run Jasmine specs, please install `jasmine-node` globally additionally to your node modules. In this case just add `npm install -g jasmine-node` after `npm install`.

You don't need `npm test` for your Jasmine specs, so you can comment it out by adding a hash key before the command. Instead, add `jasmine-node spec` to the test commands to run your Jasmine specs.

[![Comment the test command `npm test` and add `jasmine-node spec`][screenshot-test-commands]][screenshot-test-commands]





Now let's finish your setup and go to the dashboard.

[![Finish your setup. You are on the Dashboard now][screenshot-codeship-dasboard]][screenshot-codeship-dasboard]





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





You can inspect the output of a single command by clicking on it. For the `codefish` application, we can see that two Jasmine specs were run.

[![Look at the log of a single command by clicking on it][screenshot-build-log]][screenshot-build-log]





You've already pushed to your repository, watched your build log and got a green build. So you can finish the assistant at the top.

[![Finish the setup wizard by clicking on the click to finish button][screenshot-build-without-road-to-success]][screenshot-build-without-road-to-success]





Now let's deploy your application to Nodejitsu. Go to your project settings by clicking on the settings icon in the projects dropdown.

[![Go to your project settings by clicking on the settings icon in the projects dropdown][screenshot-go-to-project-settings]][screenshot-go-to-project-settings]

[![You are on the Testing Setup screen now][screenshot-project-settings]][screenshot-project-settings]

Then navigate to the "Deployment" section.

[![You are on the Deployment Setup screen now][screenshot-deployment-settings]][screenshot-deployment-settings]

As we want to deploy to Nodejitsu we click on the "Nodejitsu" button.

[![Click on the Nodejitsu button][screenshot-new-deployment]][screenshot-new-deployment]





Now you are asked to enter your Nodejitsu username and token.

To generate your Nodejitsu token, run `jitsu tokens create codeship` on the terminal.

![Create Nodejitsu token][screenshot-create-deployment-token]

Copy the token and insert it into your Codeship deployment configuration.





[![Copy and paste the Nodejitsu API key to Codeship][screenshot-complete-deployment]][screenshot-complete-deployment]

Now save your deployment by clicking on the green checkmark on the right.

[![Save your deployment configuration by clicking on the green checkmark][screenshot-saved-deployment]][screenshot-saved-deployment]

From now on Codeship will deploy your application to Nodejitsu everytime you push to your GitHub repository.





You still need to tell Nodejitsu which subdomain you want to deploy to and how to run your application.

In my case, I added `"subdomain": "codefish"` and a `"start"` script `"node start.js"`. Please adapt these parameters to whatever fits your app.

![Add Nodejitsu config][screenshot-add-deployment-config]

This way Nodejitsu will know where to publish your app and how to launch it.

Now you can commit and push this change

![Commit and push Nodejitsu config][screenshot-commit-and-push-deployment-config]





And immediately another build will start running on Codeship. Let's go back to your project overview.

[![Go back to the project overview to see a new running build][screenshot-deploy-build-started]][screenshot-deploy-build-started]

After the commands we already know from your first build, your application also gets deployed to Nodejitsu now.

[![After some initial commands were run your application gets deployed][screenshot-build-deployment]][screenshot-build-deployment]

And about 2 minutes later your application is online.

[![After about 2 minutes your application is online][screenshot-build-deployment-complete]][screenshot-build-deployment-complete]





When you open the URL of your Nodejitsu app now, your deployed application appears. You can find mine on [codefish.nodejitsu.com][codefish-live].

[![Have a look at the app you just deployed][screenshot-deployed-application]][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or please tweet us [@codeship][codeship-twitter]!

![If you need help please click the support link in the top-right corner or tweet us @codeship][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://github.com/codeship-tutorials/codefish-node
 
 
 [codefish-live]: http://codefish.nodejitsu.com
 
 [screenshot-repository]: ../screenshots/github/codefish-node/repository.png
 [screenshot-codefish-landingpage]: ../screenshots/codeship-landingpage.png
 [screenshot-oauth]: ../screenshots/github/oauth.png
 [screenshot-codeship-welcome]: ../screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: ../screenshots/github/repo-provider-selection.png
 [screenshot-repo-selection]: ../screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: ../screenshots/node/codefish-node-selection-filtered.png
 [screenshot-codeship-technology]: ../screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: ../screenshots/node/codeship-technology.png
 [screenshot-technology-version]: ../screenshots/node/technology-version.png
 [screenshot-test-commands]: ../screenshots/node/test-commands.png
 [screenshot-codeship-dasboard]: ../screenshots/github/codefish-node/codeship-dashboard.png
 [screenshot-codeship-image]: ../screenshots/node/codeship-image.png
 [screenshot-codeship-push]: ../screenshots/github/codefish-node/push.png
 [screenshot-first-build-running]: ../screenshots/node/first-build-running.png
 [screenshot-first-build-running-details]: ../screenshots/github/codefish-node/first-build-running-details.png
 [screenshot-first-build-finished]: ../screenshots/github/codefish-node/first-build-finished.png
 [screenshot-build-log]: ../screenshots/github/codefish-node/build-log.png
 [screenshot-build-without-road-to-success]: ../screenshots/github/codefish-node/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: ../screenshots/github/codefish-node/go-to-project-settings.png
 [screenshot-project-settings]: ../screenshots/node/project-settings.png
 [screenshot-deployment-settings]: ../screenshots/node/deployment-settings.png
 [screenshot-new-deployment]: ../screenshots/node/nodejitsu/new-deployment.png
 [screenshot-heroku-apps]: ../screenshots/nodejitsu/heroku-apps.png
 [screenshot-create-heroku-app]: ../screenshots/nodejitsu/create-heroku-app.png
 [screenshot-heroku-app-created]: ../screenshots/nodejitsu/heroku-app-created.png
 [screenshot-heroku-deployment-name]: ../screenshots/node/nodejitsu/heroku-deployment-name.png
 [screenshot-show-api-key]: ../screenshots/nodejitsu/show-api-key.png
 [screenshot-complete-deployment]: ../screenshots/node/nodejitsu/complete-deployment.png
 [screenshot-saved-deployment]: ../screenshots/node/nodejitsu/saved-deployment.png
 [screenshot-added-paragraph]: ../screenshots/node/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: ../screenshots/github/node/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: ../screenshots/node/nodejitsu/deploy-build-started.png
 [screenshot-build-deployment]: ../screenshots/node/nodejitsu/build-deployment.png
 [screenshot-build-deployment-complete]: ../screenshots/node/nodejitsu/build-deployment-complete.png
 [screenshot-deployed-application]: ../screenshots/node/nodejitsu/deployed-application.png
 [screenshot-select-post-hook]: ../screenshots/github/codefish-node/select-post-hook.png
 [screenshot-paste-hook-url]: ../screenshots/github/codefish-node/paste-hook-url.png
 [screenshot-hook-added]: ../screenshots/github/codefish-node/hook-added.png
 [screenshot-deployment-username]: ../screenshots/node/nodejitsu/username.png
 [screenshot-create-deployment-token]: ../screenshots/node/nodejitsu/create-token.png
 [screenshot-add-deployment-config]: ../screenshots/nodejitsu/add-config.png
 [screenshot-commit-and-push-deployment-config]: ../screenshots/github/codefish-node/nodejitsu/commit-and-push-deployment-config.png
 [screenshot-dotcloud-api-key]: ../screenshots/nodejitsu/api-key.png
 [screenshot-dotcloud-deployment-api-key]: ../screenshots/node/nodejitsu/deployment-api-key.png
 [screenshot-dotcloud-yml]: ../screenshots/node/nodejitsu/dotcloud-yml.png
 [screenshot-dotcloud-wsgi-py]: ../screenshots/node/nodejitsu/wsgi-py.png
 [screenshot-deployment-documentation-page]: ../screenshots/node/nodejitsu/documentation-page.png
 [screenshot-empty-deployment]: ../screenshots/node/nodejitsu/empty-deployment.png
 [screenshot-deployment-home-page]: ../screenshots/nodejitsu/home-page.png
 [screenshot-new-deployment-app]: ../screenshots/node/nodejitsu/new-deployment-app.png
 [screenshot-deployment-oauth]: ../screenshots/nodejitsu/oauth.png
 [screenshot-app-yml]: ../screenshots/node/nodejitsu/app-yml.png
 [screenshot-install-tool]: ../screenshots/nodejitsu/install-tool.png
 [screenshot-sign-in-to-deployment]: ../screenshots/nodejitsu/sign-in-to-deployment.png
 [screenshot-create-api-token]: ../screenshots/nodejitsu/create-api-token.png
 [screenshot-insert-api-token]: ../screenshots/nodejitsu/insert-api-token.png
 [screenshot-look-up-url]: ../screenshots/nodejitsu/look-up-url.png

