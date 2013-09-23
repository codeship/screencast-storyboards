Deploying Rails from GitHub to Heroku
======================

In this screencast we're gonna deploy a Ruby on Rails application from a GitHub repository to Heroku using the Codeship.

I've got a simple Ruby on Rails application called [codefish](https://github.com/codeship-tutorials/codefish-rails) which contains some RSpec examples.

![GitHub codefish-rails](../screenshots/codefish-rails.png)

We're gonna deploy this application to Heroku using the Codeship.

![Codeship landingpage](../../../screenshots/codeship-landingpage.png)

Let's sign in with GitHub:

![GitHub OAuth](../screenshots/oauth.png)

Codeship needs access to our GitHub repositories to be able to set them up. Let's allow access.

We're back at the Codeship. Now let's create our project.

![Codeship welcome screen](../../../screenshots/codeship-welcome.png)

We select GitHub as our repository provider.

![Repo provider selection GitHub](../screenshots/repo-provider-selection.png)

In the list of my GitHub repositories

![Repo selection GitHub](../screenshots/repo-selection.png)

I search for my repo "codefish-rails" and select it.

![Repo selection GitHub filtered](../screenshots/repo-selection-filtered.png)

Now we can set up our test commands:

![Codeship welcome screen](../../../screenshots/codeship-technology.png)

We select "Ruby on Rails" as our framework. Now the setup commands and the test commands are already prefilled. Let's uncomment the test command `bundle exec rspec` to run our RSpec examples on every build.

![Rails test commands](../screenshots/test-commands.png)

Now let's finish our setup and go to the dashboard.

![Codeship welcome screen](../../../screenshots/codeship-dashboard.png)

We can trigger a build for our application by pushing to our repository. Let's add the Codeship status image to the README file.

![Codeship welcome screen](../../screenshots/codeship-image.png)

Now let's commit and push this change.

![GitHub Push](../screenshots/push.png)

This triggered a new build on the Codeship.

![Codeship running build](../screenshots/first-build-running.png)

When we go to the build details, we can follow the running build.

![Codeship running build details](../screenshots/first-build-running-details.png)

And a few seconds later, our build succeeded! Great!

![Codeship finished build](../screenshots/first-build-finished.png)

Let's inspect our build and see what's happened.
[click on build name]
We see all the commands that were run. After a few preparation commands, the commands ran that we specified during the project setup.

![Codeship build details](../screenshots/build-details.png)

We can inspect the output of a single command by clicking on it.
[click on RSpec command]
So we can see that two RSpec examples were run

![Codeship build log](../screenshots/build-log.png)

[click on RSpec command again to close log]

We've already pushed to our repository, watched our build log and got a green build. So we can finish this assistent.

[click on road to success finish button]

![Codeship build without road to success](../screenshots/build-without-road-to-success.png)

Now let's deploy our application to Heroku. We go into our project settings

![Codeship go to project settings](../screenshots/go-to-project-settings.png)

![Codeship project settings](../screenshots/project-settings.png)

and then to the "Deployments" page.

![Codeship deployment settings](../screenshots/deployment-settings.png)
