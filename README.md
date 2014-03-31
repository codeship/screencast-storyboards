Screencast storyboards
======================

The storyboards for screecasts about how to set up Codeship with various technologies.

At the moment these storyboards exist:

| Technology | Repository | Deployment | Storyboard                                      |
| ---------- | ---------- | ---------- | ----------------------------------------------- |
| Rails      | GitHub     | Heroku     | [Storyboard](rails/github/heroku/storyboard.md) |

After you made a change to a snippet or a template, run `bundle exec ruby render` to generate the storyboards and blog posts.


##How to start

* Create (or copy) a template file for the technology in the templates folder
* If bitbucket repository add set_up_hook snippet to template
* Render with ***bundle exec ruby render***
