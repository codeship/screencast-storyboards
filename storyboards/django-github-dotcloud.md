












Deploying Django from GitHub to dotCloud
======================

In this screencast we're going to deploy a Django application from a GitHub repository to dotCloud using Codeship.





I've got a simple Django application called [codefish][codefish-repo] which contains some tests. If you want to follow along these setup steps on your computer, just fork the repository. [move mouse pointer over "fork" button]

![GitHub codefish-django][screenshot-repository]





We're going to deploy this application to dotCloud using Codeship.

![Codeship landingpage][screenshot-codefish-landingpage]

Let's sign in to Codeship with GitHub. Codeship needs access to our GitHub repositories to be able to set them up. [scroll slowly] Let's allow access.

![GitHub OAuth][screenshot-oauth]

We're back at Codeship. Now let's create our first project. [click create project button]

![Codeship welcome screen][screenshot-codeship-welcome]





The first step of our project setup is to select GitHub as our repository provider.

![Repo provider selection GitHub][screenshot-repo-provider-selection]

In the list of my GitHub repositories

![Repo selection GitHub][screenshot-repo-selection]

I search for my repo "codefish-django" and select it.

![Repo selection GitHub filtered][screenshot-repo-selection-filtered]

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





We can trigger a build for our application by pushing to our repository. Let's add the Codeship status image [move mouse over green badge] to the README file.
[add markdown code for image to editor]

![Codeship welcome screen][screenshot-codeship-image]

Now let's commit and push this change.

![GitHub Push][screenshot-codeship-push]

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

From now on Codeship will deploy our application to dotCloud everytime we push to our GitHub repository.
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
 
 [codefish-repo]: https://github.com/codeship-tutorials/codefish-django
 
 
 [codefish-live]: http://codefish-clemens.dotcloud.com
 
 [screenshot-repository]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/repository.png
 [screenshot-codefish-landingpage]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/codeship-landingpage.png
 [screenshot-oauth]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/oauth.png
 [screenshot-codeship-welcome]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/repo-provider-selection.png
 [screenshot-repo-selection]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/codefish-django-selection-filtered.png
 [screenshot-codeship-technology]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/codeship-technology.png
 [screenshot-technology-version]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/technology-version.png
 [screenshot-test-commands]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/test-commands.png
 [screenshot-codeship-dasboard]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/codeship-dashboard.png
 [screenshot-codeship-image]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/codeship-image.png
 [screenshot-codeship-readme]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/readme.png
 [screenshot-codeship-push]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/push.png
 [screenshot-first-build-running]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/first-build-running.png
 [screenshot-first-build-running-details]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/first-build-running-details.png
 [screenshot-first-build-finished]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/first-build-finished.png
 [screenshot-build-log]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/build-log.png
 [screenshot-build-without-road-to-success]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/go-to-project-settings.png
 [screenshot-project-settings]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/project-settings.png
 [screenshot-deployment-settings]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/deployment-settings.png
 [screenshot-new-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/new-deployment.png
 [screenshot-heroku-apps]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/heroku-apps.png
 [screenshot-create-heroku-app]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/create-heroku-app.png
 [screenshot-heroku-app-created]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/heroku-app-created.png
 [screenshot-heroku-deployment-name]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/heroku-deployment-name.png
 [screenshot-show-api-key]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/show-api-key.png
 [screenshot-complete-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/complete-deployment.png
 [screenshot-saved-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/saved-deployment.png
 [screenshot-added-paragraph]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/deploy-build-started.png
 [screenshot-build-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/build-deployment.png
 [screenshot-build-deployment-complete]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/build-deployment-complete.png
 [screenshot-deployed-application]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/deployed-application.png
 [screenshot-select-post-hook]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/select-post-hook.png
 [screenshot-paste-hook-url]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/paste-hook-url.png
 [screenshot-hook-added]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/hook-added.png
 [screenshot-deployment-username]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/username.png
 [screenshot-create-deployment-token]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/create-token.png
 [screenshot-add-deployment-config]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/add-config.png
 [screenshot-commit-and-push-deployment-config]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/github/codefish-django/dotcloud/commit-and-push-deployment-config.png
 [screenshot-dotcloud-api-key]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/api-key.png
 [screenshot-dotcloud-deployment-api-key]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/deployment-api-key.png
 [screenshot-dotcloud-yml]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/dotcloud-yml.png
 [screenshot-dotcloud-wsgi-py]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/wsgi-py.png
 [screenshot-deployment-documentation-page]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/documentation-page.png
 [screenshot-empty-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/empty-deployment.png
 [screenshot-deployment-home-page]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/home-page.png
 [screenshot-new-deployment-app]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/new-deployment-app.png
 [screenshot-deployment-oauth]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/oauth.png
 [screenshot-app-yml]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/django/dotcloud/app-yml.png
 [screenshot-install-tool]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/install-tool.png
 [screenshot-sign-in-to-deployment]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/sign-in-to-deployment.png
 [screenshot-create-api-token]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/create-api-token.png
 [screenshot-insert-api-token]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/insert-api-token.png
 [screenshot-look-up-url]: https://raw.githubusercontent.com/codeship/screencast-storyboards/django-github-dotcloud/screenshots/dotcloud/look-up-url.png

