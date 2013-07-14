export LOG="${LOG_FOLDER}/{{ name }}.log"


# uWSGI script itself.
exec {{ app_env }}/bin/uwsgi --master --die-on-term --memory-report --show-config  --virtualenv {{ app_env }} --pythonpath {{ app_code }} --module main --callable app --uid hero --gid hero --socket 0.0.0.0:${SECRET_SAUCE_WEB_UWSGI_PORT} --processes 2 --logto $LOG $SERVICE_COMMAND_OPTIONS

