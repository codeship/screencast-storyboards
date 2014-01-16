{% assign technology = "Django" %}
{% assign test_technology_selection = "Python" %}
{% assign technology_slug = "django" %}
{% assign tests = "tests" %}
{% assign repository = "Bitbucket" %}
{% assign repository_slug = "bitbucket" %}
{% assign deployment = "App Engine" %}
{% assign deployment_slug = "appengine" %}
{% assign repo_name = "codefish-django-appengine" %}
{% assign app_url = "my-codefish.appspot.com" %}

{% include 'snippets/header' %}
{% include 'snippets/intro' %}
{% include 'snippets/sign_up' %}
{% include 'snippets/project_setup' %}
{% include 'snippets/django/technology_setup' %}
{% include 'snippets/go_to_dashboard' %}
{% include 'snippets/bitbucket/set_up_hook' %}
{% include 'snippets/run_build' %}
{% include 'snippets/inspect_build' %}
{% include 'snippets/finish_road_to_success' %}
{% include 'snippets/configure_deployment' %}
{% include 'snippets/appengine/setup_app' %}
{% include 'snippets/save_deployment' %}
{% include 'snippets/appengine/configure_app' %}
{% include 'snippets/deployment_and_end' %}
{% include 'snippets/urls' %}
