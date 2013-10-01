{% assign technology = "Ruby on Rails" %}
{% assign technology_slug = "rails" %}
{% assign repository = "Bitbucket" %}
{% assign deployment = "Heroku" %}
{% assign repo_name = "codefish-rails" %}

{% include 'snippets/header' %}
{% include 'snippets/bitbucket/rails/codefish_rails_intro' %}
{% include 'snippets/sign_up' %}
{% include 'snippets/project_setup' %}
{% include 'snippets/rails/technology_setup' %}
{% include 'snippets/go_to_dashboard' %}
{% include 'snippets/bitbucket/set_up_hook' %}
{% include 'snippets/run_build' %}
{% include 'snippets/rails/inspect_build' %}
{% include 'snippets/finish_road_to_success' %}
{% include 'snippets/configure_deployment' %}
{% include 'snippets/heroku/setup_app' %}
{% include 'snippets/deployment_and_end' %}
