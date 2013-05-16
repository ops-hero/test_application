{% extends "base_shell.sh" %}

{% block command_body %}

export LOG="${LOG_FOLDER}/{{ name }}.log"

# Kill properly the children as well. Upstart will not do it.
trap 'kill -INT $(jobs -p)' EXIT SIGHUP SIGINT SIGTERM

# uWSGI script itself.
{{ app_env }}/bin/uwsgi --show-config  --virtualenv {{ app_env }} --pythonpath {{ app_code }} --module main --callable app --uid hero --gid hero --socket 0.0.0.0:${SECRET_SAUCE_WEB_UWSGI_PORT} --processes 2 --logto $LOG $SERVICE_COMMAND_OPTIONS

{% endblock %}