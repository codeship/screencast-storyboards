{% assign technology = "Node.js" %}
{% assign test_technology_selection = "Node.js" %}
{% assign technology_slug = "node" %}
{% assign tests = "Jasmine specs" %}
{% assign repository = "Bitbucket" %}
{% assign repository_slug = "bitbucket" %}
{% assign deployment = "Modulus" %}
{% assign deployment_slug = "modulus" %}
{% assign repo_name = "codefish-node" %}
{% assign app_url = "codefish-11988.onmodulus.com" %}

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
{% include 'snippets/modulus/setup_app' %}
{% include 'snippets/save_deployment' %}
{% include 'snippets/modulus/configure_app' %}
{% include 'snippets/deployment' %}
{% include 'snippets/modulus/look_up_url' %}
{% include 'snippets/open_deployed_application' %}
{% include 'snippets/urls' %}
