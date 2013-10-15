{% assign technology = "Node.js" %}
{% assign technology_slug = "node" %}
{% assign tests = "Jasmine specs" %}
{% assign repository = "GitHub" %}
{% assign repository_slug = "github" %}
{% assign deployment = "Heroku" %}
{% assign deployment_slug = "heroku" %}
{% assign repo_name = "codefish-node" %}
{% assign app_url = "codefish-app.herokuapp.com" %}

{% include 'snippets/header' %}
{% include 'snippets/intro' %}
{% include 'snippets/sign_up' %}
{% include 'snippets/project_setup' %}
{% include 'snippets/node/technology_setup' %}
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
