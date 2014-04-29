{% assign technology = "Node.js" %}
{% assign test_technology_selection = "Node.js" %}
{% assign technology_slug = "node" %}
{% assign tests = "Jasmine specs" %}
{% assign repository = "Bitbucket" %}
{% assign repository_slug = "bitbucket" %}
{% assign deployment = "Heroku" %}
{% assign deployment_slug = "heroku" %}
{% assign repo_name = "codefish-node" %}
{% assign app_url = "codefish-app.herokuapp.com" %}
{% assign video_id = "93054093" %}

{% include 'snippets/header' %}
{% include 'snippets/intro' %}
{% include 'snippets/sign_up' %}
{% include 'snippets/project_setup' %}
{% include 'snippets/node/technology_setup' %}
{% include 'snippets/go_to_dashboard' %}
{% include 'snippets/bitbucket/set_up_hook' %}
{% include 'snippets/run_build' %}
{% include 'snippets/inspect_build' %}
{% include 'snippets/finish_road_to_success' %}
{% include 'snippets/configure_deployment' %}
{% include 'snippets/heroku/setup_app' %}
{% include 'snippets/save_deployment' %}
{% include 'snippets/push_paragraph' %}
{% include 'snippets/deployment' %}
{% include 'snippets/open_deployed_application' %}
{% include 'snippets/urls' %}
