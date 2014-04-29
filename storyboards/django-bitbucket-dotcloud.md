












Deploying Django from Bitbucket to dotCloud
======================

In this screencast we're going to deploy a Django application from a Bitbucket repository to dotCloud using Codeship.





I've got a simple Django application called [codefish][codefish-repo] which contains some tests. If you want to follow along these setup steps on your computer, just fork the repository. [move mouse pointer over "fork" button]

![Bitbucket codefish-django][screenshot-repository]





We're going to deploy this application to dotCloud using Codeship.

![Codeship landingpage][screenshot-codefish-landingpage]

Let's sign in to Codeship with Bitbucket. Codeship needs access to our Bitbucket repositories to be able to set them up. [scroll slowly] Let's allow access.

![Bitbucket OAuth][screenshot-oauth]

We're back at Codeship. Now let's create our first project. [click create project button]

![Codeship welcome screen][screenshot-codeship-welcome]





The first step of our project setup is to select Bitbucket as our repository provider.

![Repo provider selection Bitbucket][screenshot-repo-provider-selection]

In the list of my Bitbucket repositories

![Repo selection Bitbucket][screenshot-repo-selection]

I search for my repo "codefish-django" and select it.

![Repo selection Bitbucket filtered][screenshot-repo-selection-filtered]

Now our repository is connected and we can set up our test commands:

![Codeship welcome screen][screenshot-codeship-technology]

We select "Python" as our technology. This prepopulates the setup commands and the test commands for us.

![Codeship Technology Django][screenshot-codeship-technology-selected]





We can leave the setup commands as they are. We want to install our dependencies from the `requirements.txt`. Our application doesn't need a database, so we can leave the database setup commands commented out.

[scroll to test commands]

We don't have to change the test commands either as our tests can be run with `python manage.py test`.

![Django test commands][screenshot-test-commands]





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
So we can see that two tests were run.

![Codeship build log][screenshot-build-log]

[click on test command again to close log]

![Codeship finished build][screenshot-first-build-finished]





We've already pushed to our repository, watched our build log and got a green build. So we can finish this assistant.

[click on road to success finish button]

![Codeship build without road to success][screenshot-build-without-road-to-success]





Now let's deploy our application to dotCloud. We go to our project settings by clicking on the settings icon in the projects dropdown.

![Codeship go to project settings][screenshot-go-to-project-settings]

![Codeship project settings][screenshot-project-settings]

And then to the "Deployment" section.

![Codeship deployment settings][screenshot-deployment-settings]

We want to deploy to "dotCloud".

![New dotCloud deployment][screenshot-new-deployment]





To retrieve our API key, let's follow the link to Dotcloud.

![Dotcloud API key][screenshot-dotcloud-api-key]

We copy the key [copy and close tab] and insert it into our deployment configuration at Codeship.

![Dotcloud deployment with API key][screenshot-dotcloud-deployment-api-key]

We want to name our application "codefish". The application will be automatically created the first time we deploy to Dotcloud.





![Complete dotCloud deployment][screenshot-complete-deployment]

Now let's save our deployment configuration.

![Saved dotCloud deployment][screenshot-saved-deployment]

From now on Codeship will deploy our application to dotCloud everytime we push to our Bitbucket repository.
Let's go back to our Dashboard.





Let's get our application ready for Dotcloud. We create a file `dotcloud.yml` in the root directory of our application. In this configuration file we tell Dotcloud that our web application is of type "python".

![dotcloud.yml][screenshot-dotcloud-yml]

Dotcloud also needs a `wsgi.py` file in the root directory of our application. I just copy the content from [the Dotcloud Django documentation page](http://docs.dotcloud.com/tutorials/python/django/#wsgi-py)

![Dotcloud Django documentation page][screenshot-deployment-documentation-page]

and change the app name to "codefish".

![Dotcloud wsgi.py][screenshot-dotcloud-wsgi-py]

I commit and push this change

![Commit and push Dotcloud config][screenshot-commit-and-push-deployment-config]





and immediately another build starts running on Codeship. I will fast-forward until the build is finished.

![Deploy build started][screenshot-deploy-build-started]

After the commands we already know from our first build, our application also gets deployed to dotCloud now.

![Build Deployment][screenshot-build-deployment]

And about 2 minutes later our application is online.

![Build Deployment Complete][screenshot-build-deployment-complete]





When we open [codefish-clemens.dotcloud.com][codefish-live] now, our deployed application appears.

![Deployed Application][screenshot-deployed-application]

#########RECORD VIDEO FROM HERE

If you need help with setting up your own application, please use the support link in the top-right corner or tweet us at [codeship][codeship-twitter]!

Take a look at all of our other deployment videos and blogposts at blog.codeship.io.
If you want to give Codeship a try click the sign up link that will open right after the video.

Ship long and prosper

![Build Deployment Complete][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://bitbucket.org/codeship-tutorials/codefish-django
 
 
 [codefish-live]: http://codefish-clemens.dotcloud.com
 
 [screenshot-repository]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/repository.png
 [screenshot-codefish-landingpage]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/codeship-landingpage.png
 [screenshot-oauth]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/oauth.png
 [screenshot-codeship-welcome]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/repo-provider-selection.png
 [screenshot-repo-selection]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/codefish-django-selection-filtered.png
 [screenshot-codeship-technology]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/codeship-technology.png
 [screenshot-technology-version]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/technology-version.png
 [screenshot-test-commands]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/test-commands.png
 [screenshot-codeship-dasboard]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/codeship-dashboard.png
 [screenshot-codeship-image]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/codeship-image.png
 [screenshot-codeship-push]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/push.png
 [screenshot-first-build-running]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/first-build-running.png
 [screenshot-first-build-running-details]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/first-build-running-details.png
 [screenshot-first-build-finished]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/first-build-finished.png
 [screenshot-build-log]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/build-log.png
 [screenshot-build-without-road-to-success]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/go-to-project-settings.png
 [screenshot-project-settings]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/project-settings.png
 [screenshot-deployment-settings]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/deployment-settings.png
 [screenshot-new-deployment]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/new-deployment.png
 [screenshot-heroku-apps]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/heroku-apps.png
 [screenshot-create-heroku-app]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/create-heroku-app.png
 [screenshot-heroku-app-created]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/heroku-app-created.png
 [screenshot-heroku-deployment-name]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/heroku-deployment-name.png
 [screenshot-show-api-key]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/show-api-key.png
 [screenshot-complete-deployment]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/complete-deployment.png
 [screenshot-saved-deployment]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/saved-deployment.png
 [screenshot-added-paragraph]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/django/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/deploy-build-started.png
 [screenshot-build-deployment]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/build-deployment.png
 [screenshot-build-deployment-complete]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/build-deployment-complete.png
 [screenshot-deployed-application]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/deployed-application.png
 [screenshot-select-post-hook]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/select-post-hook.png
 [screenshot-paste-hook-url]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/paste-hook-url.png
 [screenshot-hook-added]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/hook-added.png
 [screenshot-deployment-username]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/username.png
 [screenshot-create-deployment-token]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/create-token.png
 [screenshot-add-deployment-config]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/add-config.png
 [screenshot-commit-and-push-deployment-config]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/bitbucket/codefish-django/dotcloud/commit-and-push-deployment-config.png
 [screenshot-dotcloud-api-key]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/api-key.png
 [screenshot-dotcloud-deployment-api-key]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/deployment-api-key.png
 [screenshot-dotcloud-yml]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/dotcloud-yml.png
 [screenshot-dotcloud-wsgi-py]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/wsgi-py.png
 [screenshot-deployment-documentation-page]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/documentation-page.png
 [screenshot-empty-deployment]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/empty-deployment.png
 [screenshot-deployment-home-page]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/home-page.png
 [screenshot-new-deployment-app]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/new-deployment-app.png
 [screenshot-deployment-oauth]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/oauth.png
 [screenshot-app-yml]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/django/dotcloud/app-yml.png
 [screenshot-install-tool]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/install-tool.png
 [screenshot-sign-in-to-deployment]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/sign-in-to-deployment.png
 [screenshot-create-api-token]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/create-api-token.png
 [screenshot-insert-api-token]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/insert-api-token.png
 [screenshot-look-up-url]: https://github.com/codeship/screencast-storyboards/tree/django-bitbucket-dotcloud/screenshots/dotcloud/look-up-url.png

