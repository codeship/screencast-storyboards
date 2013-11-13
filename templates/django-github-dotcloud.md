{% assign technology = "Django" %}
{% assign test_technology_selection = "Python" %}
{% assign technology_slug = "django" %}
{% assign tests = "tests" %}
{% assign repository = "GitHub" %}
{% assign repository_slug = "github" %}
{% assign deployment = "Dotcloud" %}
{% assign deployment_slug = "dotcloud" %}
{% assign repo_name = "codefish-django" %}
{% assign app_url = "codefish-app.herokuapp.com" %}

{% include 'snippets/header' %}
{% include 'snippets/intro' %}
{% include 'snippets/sign_up' %}
{% include 'snippets/project_setup' %}
{% include 'snippets/django/technology_setup' %}
{% include 'snippets/go_to_dashboard' %}
{% include 'snippets/run_build' %}
{% include 'snippets/inspect_build' %}
{% include 'snippets/finish_road_to_success' %}
{% include 'snippets/configure_deployment' %}
{% include 'snippets/dotcloud/setup_app' %}
{% include 'snippets/save_deployment' %}
{% include 'snippets/dotcloud/configure_app' %}
{% include 'snippets/push_paragraph' %}
{% include 'snippets/deployment_and_end' %}
{% include 'snippets/urls' %}