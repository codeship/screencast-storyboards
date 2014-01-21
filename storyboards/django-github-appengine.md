













Deploying Django from GitHub to App Engine
======================

In this screencast we're gonna deploy a Django application from a GitHub repository to App Engine using the Codeship.





I've got a simple Django application called [codefish][codefish-repo] which contains some tests. If you want to follow along these setup steps on your computer, just fork the repository. [move mouse pointer over "fork" button]

![GitHub codefish-django-appengine][screenshot-repository]





We're gonna deploy this application to App Engine using the Codeship.

![Codeship landingpage][screenshot-codefish-landingpage]

Let's sign in to the Codeship with GitHub. The Codeship needs access to our GitHub repositories to be able to set them up. [scroll slowly] Let's allow access.

![GitHub OAuth][screenshot-oauth]

We're back at the Codeship. Now let's create our first project. [click create project button]

![Codeship welcome screen][screenshot-codeship-welcome]





The first step of our project setup is to select GitHub as our repository provider.

![Repo provider selection GitHub][screenshot-repo-provider-selection]

In the list of my GitHub repositories

![Repo selection GitHub][screenshot-repo-selection]

I search for my repo "codefish-django-appengine" and select it.

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
So we can see that two tests were run.

![Codeship build log][screenshot-build-log]

[click on test command again to close log]

![Codeship finished build][screenshot-first-build-finished]





We've already pushed to our repository, watched our build log and got a green build. So we can finish this assistant.

[click on road to success finish button]

![Codeship build without road to success][screenshot-build-without-road-to-success]





Now let's deploy our application to App Engine. We go to our project settings by clicking on the settings icon in the projects dropdown.

![Codeship go to project settings][screenshot-go-to-project-settings]

![Codeship project settings][screenshot-project-settings]

And then to the "Deployment" section.

![Codeship deployment settings][screenshot-deployment-settings]

We want to deploy to "App Engine".

![New App Engine deployment][screenshot-new-deployment]





Before we can configure our App Engine deployment, we need to connect our App Engine account to Codeship.

[Click "Connect to App Engine"]

![App Engine OAuth dialog][screenshot-deployment-oauth]

Let's accept the connection.

When we select "App Engine" again, we can configure our deployment.

![Empty App Engine deployment][screenshot-empty-deployment]

We can leave the path as it is, but I'd like to enter the URL to our application.

So let's create an application on App Engine.

![App Engine home page][screenshot-deployment-home-page]

[go to appengine.google.com and click "create application"]

I enter "my-codefish" as identifier and "Codefish" as application name and I create the application.

![Creating an App Engine app][screenshot-new-deployment-app]

[close App Engine tab]

Now I can enter my application URL `http://my-codefish.appspot.com` into my deployment configuration. This way the Codeship can check if my application works after deployment.





![Complete App Engine deployment][screenshot-complete-deployment]

Now let's save our deployment configuration.

![Saved App Engine deployment][screenshot-saved-deployment]

From now on the Codeship will deploy our application to App Engine everytime we push to our GitHub repository.





Let's get our application ready for App Engine. We create a file `app.yml` in the root directory of our application. In this configuration file we tell App Engine that our web application is called "my-codefish" and that it is a python app.

We say that the version is "1" and the api version is "1" as well. And finally we add a handler for all urls to be handled by `django_bootstrap.py`.

![app.yml][screenshot-app-yml]

I commit and push this change

![Commit and push App Engine config][screenshot-commit-and-push-deployment-config]





and immediately another build starts running on the Codeship. Let's go back to our project overview. I will fast-forward until the build is finished.

![Deploy build started][screenshot-deploy-build-started]

After the commands we already know from our first build, our application also gets deployed to App Engine now.

![Build Deployment][screenshot-build-deployment]

And about 2 minutes later our application is online.

![Build Deployment Complete][screenshot-build-deployment-complete]

When we open [my-codefish.appspot.com][codefish-live] now, our deployed application appears.

![Deployed Application][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or tweet us at [codeship][codeship-twitter]!

![Build Deployment Complete][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://github.com/codeship-tutorials/codefish-django-appengine
 
 
 [codefish-live]: http://my-codefish.appspot.com
 
 [screenshot-repository]: ../screenshots/github/codefish-django-appengine/repository.png
 [screenshot-codefish-landingpage]: ../screenshots/codeship-landingpage.png
 [screenshot-oauth]: ../screenshots/github/oauth.png
 [screenshot-codeship-welcome]: ../screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: ../screenshots/github/repo-provider-selection.png
 [screenshot-repo-selection]: ../screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: ../screenshots/django/codefish-django-appengine-selection-filtered.png
 [screenshot-codeship-technology]: ../screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: ../screenshots/django/codeship-technology.png
 [screenshot-technology-version]: ../screenshots/django/technology-version.png
 [screenshot-test-commands]: ../screenshots/django/test-commands.png
 [screenshot-codeship-dasboard]: ../screenshots/github/codefish-django-appengine/codeship-dashboard.png
 [screenshot-codeship-image]: ../screenshots/django/codeship-image.png
 [screenshot-codeship-push]: ../screenshots/github/codefish-django-appengine/push.png
 [screenshot-first-build-running]: ../screenshots/django/first-build-running.png
 [screenshot-first-build-running-details]: ../screenshots/github/codefish-django-appengine/first-build-running-details.png
 [screenshot-first-build-finished]: ../screenshots/github/codefish-django-appengine/first-build-finished.png
 [screenshot-build-log]: ../screenshots/github/codefish-django-appengine/build-log.png
 [screenshot-build-without-road-to-success]: ../screenshots/github/codefish-django-appengine/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: ../screenshots/github/codefish-django-appengine/go-to-project-settings.png
 [screenshot-project-settings]: ../screenshots/django/project-settings.png
 [screenshot-deployment-settings]: ../screenshots/django/deployment-settings.png
 [screenshot-new-deployment]: ../screenshots/django/appengine/new-deployment.png
 [screenshot-heroku-apps]: ../screenshots/appengine/heroku-apps.png
 [screenshot-create-heroku-app]: ../screenshots/appengine/create-heroku-app.png
 [screenshot-heroku-app-created]: ../screenshots/appengine/heroku-app-created.png
 [screenshot-heroku-deployment-name]: ../screenshots/django/appengine/heroku-deployment-name.png
 [screenshot-show-api-key]: ../screenshots/appengine/show-api-key.png
 [screenshot-complete-deployment]: ../screenshots/django/appengine/complete-deployment.png
 [screenshot-saved-deployment]: ../screenshots/django/appengine/saved-deployment.png
 [screenshot-added-paragraph]: ../screenshots/django/added-paragraph.png
 [screenshot-commit-and-push-paragraph]: ../screenshots/github/django/commit-and-push-paragraph.png
 [screenshot-deploy-build-started]: ../screenshots/django/appengine/deploy-build-started.png
 [screenshot-build-deployment]: ../screenshots/django/appengine/build-deployment.png
 [screenshot-build-deployment-complete]: ../screenshots/django/appengine/build-deployment-complete.png
 [screenshot-deployed-application]: ../screenshots/django/appengine/deployed-application.png
 [screenshot-select-post-hook]: ../screenshots/github/codefish-django-appengine/select-post-hook.png
 [screenshot-paste-hook-url]: ../screenshots/github/codefish-django-appengine/paste-hook-url.png
 [screenshot-hook-added]: ../screenshots/github/codefish-django-appengine/hook-added.png
 [screenshot-deployment-username]: ../screenshots/django/appengine/username.png
 [screenshot-create-deployment-token]: ../screenshots/django/appengine/create-token.png
 [screenshot-add-deployment-config]: ../screenshots/appengine/add-config.png
 [screenshot-commit-and-push-deployment-config]: ../screenshots/github/codefish-django-appengine/commit-and-push-deployment-config.png
 [screenshot-dotcloud-api-key]: ../screenshots/appengine/api-key.png
 [screenshot-dotcloud-deployment-api-key]: ../screenshots/django/appengine/deployment-api-key.png
 [screenshot-dotcloud-yml]: ../screenshots/django/appengine/dotcloud-yml.png
 [screenshot-dotcloud-wsgi-py]: ../screenshots/django/appengine/wsgi-py.png
 [screenshot-deployment-documentation-page]: ../screenshots/django/appengine/documentation-page.png
 [screenshot-empty-deployment]: ../screenshots/django/appengine/empty-deployment.png
 [screenshot-deployment-home-page]: ../screenshots/appengine/home-page.png
 [screenshot-new-deployment-app]: ../screenshots/django/appengine/new-deployment-app.png
 [screenshot-deployment-oauth]: ../screenshots/appengine/oauth.png
 [screenshot-app-yml]: ../screenshots/django/appengine/app-yml.png

