













How to set up Continuous Integration and Continuous Deployment for a Django Application from GitHub to App Engine
======================

In this blog post we're gonna deploy a Django application from a GitHub repository to App Engine using [the Codeship][codeship].





We've set up a simple Django application called [codefish][codefish-repo] which contains some tests. We'll use screenshots of this application in this blog post. If you haven't got an own project to set up but you want to follow along on your computer, just fork the repository.

[![codefish-django-appengine on GitHub][screenshot-repository]][screenshot-repository]





Together, we're gonna deploy this application to App Engine using the Codeship.

[![The Codeship Landing Page][screenshot-codefish-landingpage]][screenshot-codefish-landingpage]

First, sign in to the Codeship with GitHub. The Codeship needs access to your GitHub repositories to be able to set them up. Let's allow access.

[![GitHub Access][screenshot-oauth]][screenshot-oauth]

We're back at the Codeship. Now let's create your first project.

[![Let's set up our first project on the Codeship][screenshot-codeship-welcome]][screenshot-codeship-welcome]





The first step of your project setup is to select GitHub as your repository provider.

[![Select your repository provider][screenshot-repo-provider-selection]][screenshot-repo-provider-selection]

In the list of your GitHub repositories

[![Search for your repository in the list][screenshot-repo-selection]][screenshot-repo-selection]

search for the repository you want to set up and select it. In my case I search for "codefish".

[![Find your repository in the filtered list][screenshot-repo-selection-filtered]][screenshot-repo-selection-filtered]

Now your repository is connected and you can set up your test commands:

[![Set up your test commands][screenshot-codeship-technology]][screenshot-codeship-technology]

Codefish is a Django application. Therefore let's choose "Python" as your technology. This prepopulates the setup commands and the test commands for you.

[![Select Django as your technology][screenshot-codeship-technology-selected]][screenshot-codeship-technology-selected]





For my application I don't use a database, so I leave the setup commands as they are. If you want to run the `syncdb` or the `migrate` command for your application, just uncomment the commands by removing the `#` in front of them.

If you want to run your tests with `python manage.py test`, you don't need to change the test commands. Otherwise just enter your own test commands.

![Django test commands][screenshot-test-commands]





Now let's finish your setup and go to the dashboard.

[![Finish your setup. You are on the Dashboard now][screenshot-codeship-dasboard]][screenshot-codeship-dasboard]





You can trigger a build for your application by pushing to your repository. Let's add the Codeship status image to the README file. I use markdown syntax to insert the image.

[![Copy the code for the Codeship status badge to your README file][screenshot-codeship-image]][screenshot-codeship-image]

Now commit and push this change.

[![Commit and push your change][screenshot-codeship-push]][screenshot-codeship-push]

This triggered a new build on the Codeship.

[![A new build got triggered on the Codeship][screenshot-first-build-running]][screenshot-first-build-running]

You can access the build details by clicking the arrow on the right. Here you can follow the running build.

[![Click on the arrow to the right to access the build details][screenshot-first-build-running-details]][screenshot-first-build-running-details]

And a few seconds later your build succeeded! Great!

[![Look at all the commands that are running][screenshot-first-build-finished]][screenshot-first-build-finished]

You see all the commands that were run. After a few initial preparation commands the Codeship ran the commands that you specified a few moments ago.





You can inspect the output of a single command by clicking on it. For the `codefish` application, we can see that two tests were run.

[![Look at the log of a single command by clicking on it][screenshot-build-log]][screenshot-build-log]





You've already pushed to your repository, watched your build log and got a green build. So you can finish the assistant at the top.

[![Finish the setup wizard by clicking on the click to finish button][screenshot-build-without-road-to-success]][screenshot-build-without-road-to-success]





Now let's deploy your application to App Engine. Go to your project settings by clicking on the settings icon in the projects dropdown.

[![Go to your project settings by clicking on the settings icon in the projects dropdown][screenshot-go-to-project-settings]][screenshot-go-to-project-settings]

[![You are on the Testing Setup screen now][screenshot-project-settings]][screenshot-project-settings]

Then navigate to the "Deployment" section.

[![You are on the Deployment Setup screen now][screenshot-deployment-settings]][screenshot-deployment-settings]

As we want to deploy to App Engine we click on the "App Engine" button.

[![Click on the App Engine button][screenshot-new-deployment]][screenshot-new-deployment]





Before you can configure your App Engine deployment, you need to connect your App Engine account to Codeship by clicking the link.

![App Engine OAuth dialog][screenshot-deployment-oauth]

Let's accept the connection.

When you select "App Engine" again, you can configure your deployment.

![Empty App Engine deployment][screenshot-empty-deployment]

You can leave the path as it is, but if you'd like the Codeship to check if your deployment worked, you should insert the URL of your application.

So let's go to [appengine.google.com][https://appengine.google.com] and create an application first.

![App Engine home page][screenshot-deployment-home-page]

There you need to enter an identifier for your app (in my case "my-codefish") and a title (in my case "Codefish") and create the application.

![Creating an App Engine app][screenshot-new-deployment-app]

[close App Engine tab]

Now you can enter your application URL `http://YOUR_APP_IDENTIFIER.appspot.com` into your deployment configuration. This way the Codeship can check if your application works after deployment.





[![Copy and paste the App Engine API key to the Codeship][screenshot-complete-deployment]][screenshot-complete-deployment]

Now save your deployment by clicking on the green checkmark on the right.

[![Save your deployment configuration by clicking on the green checkmark][screenshot-saved-deployment]][screenshot-saved-deployment]

From now on the Codeship will deploy your application to App Engine everytime you push to your GitHub repository.



Let's get our application ready for App Engine. We create a file `app.yml` in the root directory of our application. In this configuration file we tell App Engine that our web application is called "my-codefish" and that it is a python app.

We say that the version is "1" and the api version is "1" as well. And finally we add a handler for all urls to be handled by `django_bootstrap.py`.

![app.yml][screenshot-app-yml]

I commit and push this change

![Commit and push App Engine config][screenshot-commit-and-push-deployment-config]



And immediately another build will start running on the Codeship. Let's go back to your project overview.

[![Go back to the project overview to see a new running build][screenshot-deploy-build-started]][screenshot-deploy-build-started]

After the commands we already know from your first build, your application also gets deployed to App Engine now.

[![After some initial commands were run your application gets deployed][screenshot-build-deployment]][screenshot-build-deployment]

And about 2 minutes later your application is online.

[![After about 2 minutes your application is online][screenshot-build-deployment-complete]][screenshot-build-deployment-complete]

When you open the URL of your App Engine app now, your deployed application appears. You can find mine on [my-codefish.appspot.com][codefish-live].

[![Have a look at the app you just deployed][screenshot-deployed-application]][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or please tweet us [@codeship][codeship-twitter]!

![If you need help please click the support link in the top-right corner or tweet us @codeship][screenshot-build-deployment-complete]



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

