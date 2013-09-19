Deploying Rails from GitHub to Heroku
======================

In this screencast we're gonna deploy a Ruby on Rails application from a GitHub repository to Heroku using the Codeship.

I've got a simple Ruby on Rails application called (codefish)[https://github.com/codeship-tutorials/codefish-rails] which contains some RSpec examples.

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

To can trigger a build for our application by pushing to our repository. Let's add the Codeship status image to the README file.

![Codeship welcome screen](../../screenshots/codeship-image.png)

Now let's commit and push this change.

![GitHub Push](../screenshots/push.png)
