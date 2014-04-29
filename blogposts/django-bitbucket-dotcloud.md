












<iframe src="http://player.vimeo.com/video/" height="498" width="885" allowfullscreen="" frameborder="0"></iframe>

How to set up Continuous Integration and Continuous Deployment for a Django Application from Bitbucket to dotCloud
======================

In this blog post we're going to deploy a Django application from a Bitbucket repository to dotCloud using [Codeship][codeship].





We've set up a simple Django application called [codefish][codefish-repo] which contains some tests. We'll use screenshots of this application in this blog post. If you haven't got your own project to set up but you want to follow along on your computer, just fork the repository.

[![codefish-django on Bitbucket][screenshot-repository]][screenshot-repository]





Together, we're going to deploy this application to dotCloud using Codeship.

[![Codeship Landing Page][screenshot-codefish-landingpage]][screenshot-codefish-landingpage]

First, sign in to Codeship with Bitbucket. Codeship needs access to your Bitbucket repositories to be able to set them up. Let's allow access.

[![Bitbucket Access][screenshot-oauth]][screenshot-oauth]

We're back at Codeship. Now let's create your first project.

[![Let's set up our first project on Codeship][screenshot-codeship-welcome]][screenshot-codeship-welcome]





The first step of your project setup is to select Bitbucket as your repository provider.

[![Select your repository provider][screenshot-repo-provider-selection]][screenshot-repo-provider-selection]

In the list of your Bitbucket repositories

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





To start your first build, you need to add a push hook to your Bitbucket repository. Copy the hook url and follow the link to the service hook settings of your repository. Add a "POST" hook there,

[![Bitbucket select POST hook][screenshot-select-post-hook]][screenshot-select-post-hook]

paste the hook url

[![Bitbucket paste hook URL][screenshot-paste-hook-url]][screenshot-paste-hook-url]

and save the hook.

[![Bitbucket hook URL][screenshot-hook-added]][screenshot-hook-added]





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





You can inspect the output of a single command by clicking on it. For the `codefish` application, we can see that two tests were run.

[![Look at the log of a single command by clicking on it][screenshot-build-log]][screenshot-build-log]





You've already pushed to your repository, watched your build log and got a green build. So you can finish the assistant at the top.

[![Finish the setup wizard by clicking on the click to finish button][screenshot-build-without-road-to-success]][screenshot-build-without-road-to-success]





Now let's deploy your application to dotCloud. Go to your project settings by clicking on the settings icon in the projects dropdown.

[![Go to your project settings by clicking on the settings icon in the projects dropdown][screenshot-go-to-project-settings]][screenshot-go-to-project-settings]

[![You are on the Testing Setup screen now][screenshot-project-settings]][screenshot-project-settings]

Then navigate to the "Deployment" section.

[![You are on the Deployment Setup screen now][screenshot-deployment-settings]][screenshot-deployment-settings]

As we want to deploy to dotCloud we click on the "dotCloud" button.

[![Click on the dotCloud button][screenshot-new-deployment]][screenshot-new-deployment]





To retrieve your API key, just follow the link to Dotcloud.

![Dotcloud API key][screenshot-dotcloud-api-key]

Copy the key and insert it into your deployment configuration at Codeship.

![Dotcloud deployment with API key][screenshot-dotcloud-deployment-api-key]

You can name your application whatever you like. The application will be automatically created the first time you deploy to Dotcloud.





[![Copy and paste the dotCloud API key to Codeship][screenshot-complete-deployment]][screenshot-complete-deployment]

Now save your deployment by clicking on the green checkmark on the right.

[![Save your deployment configuration by clicking on the green checkmark][screenshot-saved-deployment]][screenshot-saved-deployment]

From now on Codeship will deploy your application to dotCloud everytime you push to your Bitbucket repository.
Let's go back to our Dashboard.





Let's get your application ready for Dotcloud. Dotcloud expects a file `dotcloud.yml` in the root directory of your application. In this configuration file you need to tell Dotcloud that your web application is of type "python".

    www:
      type: python

Dotcloud also needs a `wsgi.py` file in the root directory of your application. Just copy the content from [the Dotcloud Django documentation page](http://docs.dotcloud.com/tutorials/python/django/#wsgi-py)

![Dotcloud Django documentation page][screenshot-deployment-documentation-page]

and replace the app name `hellodjango` with your own Django application's name.

![Dotcloud wsgi.py][screenshot-dotcloud-wsgi-py]

Now you can commit and push this change

![Commit and push Dotcloud config][screenshot-commit-and-push-deployment-config]





And immediately another build will start running on Codeship.

[![Go back to the project overview to see a new running build][screenshot-deploy-build-started]][screenshot-deploy-build-started]

After the commands we already know from your first build, your application also gets deployed to dotCloud now.

[![After some initial commands were run your application gets deployed][screenshot-build-deployment]][screenshot-build-deployment]

And about 2 minutes later your application is online.

[![After about 2 minutes your application is online][screenshot-build-deployment-complete]][screenshot-build-deployment-complete]





When you open the URL of your dotCloud app now, your deployed application appears. You can find mine on [codefish-clemens.dotcloud.com][codefish-live].

[![Have a look at the app you just deployed][screenshot-deployed-application]][screenshot-deployed-application]

If you need help with setting up your own application, please use the support link in the top-right corner or please tweet us [@codeship][codeship-twitter]!

![If you need help please click the support link in the top-right corner or tweet us @codeship][screenshot-build-deployment-complete]



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

