{% assign technology = "Ruby on Rails" %}
{% assign test_technology_selection = "Ruby on Rails" %}
{% assign technology_slug = "rails" %}
{% assign tests = "RSpec examples" %}
{% assign repository = "GitHub" %}
{% assign repository_slug = "github" %}
{% assign deployment = "Heroku" %}
{% assign deployment_slug = "heroku" %}
{% assign repo_name = "codefish-rails" %}
{% assign app_url = "codefish-app.herokuapp.com" %}

{% include 'snippets/header' %}
{% include 'snippets/intro' %}
{% include 'snippets/sign_up' %}
{% include 'snippets/project_setup' %}
{% include 'snippets/rails/technology_setup' %}
{% include 'snippets/go_to_dashboard' %}
{% include 'snippets/run_build' %}
{% include 'snippets/inspect_build' %}
{% include 'snippets/finish_road_to_success' %}
{% include 'snippets/configure_deployment' %}
{% include 'snippets/heroku/setup_app' %}
{% include 'snippets/save_deployment' %}
{% include 'snippets/push_paragraph' %}
{% include 'snippets/deployment_and_end' %}
{% include 'snippets/urls' %}
