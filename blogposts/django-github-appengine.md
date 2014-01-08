












How to set up Continuous Integration and Continuous Deployment for a Django Application from GitHub to AppEngine
======================

In this blog post we're gonna deploy a Django application from a GitHub repository to AppEngine using [the Codeship][codeship].





We've set up a simple Django application called [codefish][codefish-repo] which contains some tests. We'll use screenshots of this application in this blog post. If you haven't got an own project to set up but you want to follow along on your computer, just fork the repository.

[![codefish-django-appengine on GitHub][screenshot-codefish-django-appengine]][screenshot-codefish-django-appengine]





Together, we're gonna deploy this application to AppEngine using the Codeship.

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





Now let's deploy your application to AppEngine. Go to your project settings by clicking on the settings icon in the projects dropdown.

[![Go to your project settings by clicking on the settings icon in the projects dropdown][screenshot-go-to-project-settings]][screenshot-go-to-project-settings]

[![You are on the Testing Setup screen now][screenshot-project-settings]][screenshot-project-settings]

Then navigate to the "Deployment" section.

[![You are on the Deployment Setup screen now][screenshot-deployment-settings]][screenshot-deployment-settings]

As we want to deploy to AppEngine we click on the "AppEngine" button.

[![Click on the AppEngine button][screenshot-new-deployment]][screenshot-new-deployment]





To retrieve your API key, just follow the link to Dotcloud.

![Dotcloud API key][screenshot-dotcloud-api-key]

Copy the key and insert it into your deployment configuration at the Codeship.

![Dotcloud deployment with API key][screenshot-dotcloud-deployment-api-key]

You can name your application whatever you like. The application will be automatically created the first time you deploy to Dotcloud.





[![Copy and paste the AppEngine API key to the Codeship][screenshot-complete-deployment]][screenshot-complete-deployment]

Now save your deployment by clicking on the green checkmark on the right.

[![Save your deployment configuration by clicking on the green checkmark][screenshot-saved-deployment]][screenshot-saved-deployment]

From now on the Codeship will deploy your application to AppEngine everytime you push to your GitHub repository.





Let's get your application ready for Dotcloud. Dotcloud expects a file `dotcloud.yml` in the root directory of your application. In this configuration file you need to tell Dotcloud that your web application is of type "python".

    www:
      type: python

Dotcloud also needs a `wsgi.py` file in the root directory of your application. Just copy the content from [the Dotcloud Django documentation page](http://docs.dotcloud.com/tutorials/python/django/#wsgi-py)

![Dotcloud Django documentation page][screenshot-deployment-documentation-page]

and replace the app name `hellodjango` with your own Django application's name.

![Dotcloud wsgi.py][screenshot-dotcloud-wsgi-py]

Now you can commit and push this change

![Commit and push Dotcloud config][screenshot-commit-and-push-deployment-config]





And immediately another build will start running on the Codeship. Let's go back to your project overview.

[![Go back to the project overview to see a new running build][screenshot-deploy-build-started]][screenshot-deploy-build-started]

After the commands we already know from your first build, your application also gets deployed to AppEngine now.

[![After some initial commands were run your application gets deployed][screenshot-build-deployment]][screenshot-build-deployment]

And about 2 minutes later your application is online.

[![After about 2 minutes your application is online][screenshot-build-deployment-complete]][screenshot-build-deployment-complete]

When you open the URL of your AppEngine app now, your deployed application appears. You can find mine on [codefish-django.appspot.com][codefish-live].

[![Have a look at the app you just deployed][screenshot-deployed-application]][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or please tweet us [@codeship][codeship-twitter]!

![If you need help please click the support link in the top-right corner or tweet us @codeship][screenshot-build-deployment-complete]



 [codeship]: https://www.codeship.io/
 [codeship-twitter]: http://www.twitter.com/codeship
 
 [codefish-repo]: https://github.com/codeship-tutorials/codefish-django
 
 
 [screenshot-codefish-django-appengine]: ../screenshots/github/codefish-django-appengine.png
 [screenshot-codefish-landingpage]: ../screenshots/codeship-landingpage.png
 [screenshot-oauth]: ../screenshots/github/oauth.png
 [screenshot-codeship-welcome]: ../screenshots/codeship-welcome.png
 [screenshot-repo-provider-selection]: ../screenshots/github/repo-provider-selection.png
 [screenshot-repo-selection]: ../screenshots/repo-selection.png
 [screenshot-repo-selection-filtered]: ../screenshots/django/repo-selection-filtered.png
 [screenshot-codeship-technology]: ../screenshots/codeship-technology.png
 [screenshot-codeship-technology-selected]: ../screenshots/django/codeship-technology.png
 [screenshot-technology-version]: ../screenshots/django/technology-version.png
 [screenshot-test-commands]: ../screenshots/django/test-commands.png
 [screenshot-codeship-dasboard]: ../screenshots/github/django/codeship-dashboard.png
 [screenshot-codeship-image]: ../screenshots/django/codeship-image.png
 [screenshot-codeship-push]: ../screenshots/github/django/push.png
 [screenshot-first-build-running]: ../screenshots/django/first-build-running.png
 [screenshot-first-build-running-details]: ../screenshots/github/django/first-build-running-details.png
 [screenshot-first-build-finished]: ../screenshots/github/django/first-build-finished.png
 [screenshot-build-log]: ../screenshots/github/django/build-log.png
 [screenshot-build-without-road-to-success]: ../screenshots/github/django/build-without-road-to-success.png
 [screenshot-go-to-project-settings]: ../screenshots/github/django/go-to-project-settings.png
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
 [screenshot-select-post-hook]: ../screenshots/github/django/select-post-hook.png
 [screenshot-paste-hook-url]: ../screenshots/github/django/paste-hook-url.png
 [screenshot-hook-added]: ../screenshots/github/django/hook-added.png
 [screenshot-deployment-username]: ../screenshots/django/appengine/username.png
 [screenshot-create-deployment-token]: ../screenshots/django/appengine/create-token.png
 [screenshot-add-deployment-config]: ../screenshots/appengine/add-config.png
 [screenshot-commit-and-push-deployment-config]: ../screenshots/github/django/commit-and-push-deployment-config.png
 [screenshot-dotcloud-api-key]: ../screenshots/appengine/api-key.png
 [screenshot-dotcloud-deployment-api-key]: ../screenshots/django/appengine/deployment-api-key.png
 [screenshot-dotcloud-yml]: ../screenshots/django/appengine/dotcloud-yml.png
 [screenshot-dotcloud-wsgi-py]: ../screenshots/django/appengine/wsgi-py.png
 [screenshot-deployment-documentation-page]: ../screenshots/django/appengine/documentation-page.png
