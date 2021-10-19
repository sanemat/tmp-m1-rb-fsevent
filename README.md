Got Errno::ENOSYS with docker linux/amd64 on arm64 m1 mac

I got error below with linux/amd64 container on arm64 m1 mac

with 
```
config/environments/development.rb
config.file_watcher = ActiveSupport::EventedFileUpdateChecker
```

```
docker-compose up --build -d
docker-compose run -e SKIP_TEST_DATABASE=true web bin/rails db:setup --trace
```

then
```
$ docker-compose run -e SKIP_TEST_DATABASE=true web bin/rails db:setup --trace  
[+] Running 1/0
 ⠿ Container tmp-m1-rb-fsevent-db-1  Created                                                                                                              0.0s
[+] Running 1/1
 ⠿ Container tmp-m1-rb-fsevent-db-1  Started                                                                                                              0.4s
** Invoke db:setup (first_time)
** Invoke db:create (first_time)
** Invoke db:load_config (first_time)
** Invoke environment (first_time)
** Execute environment
rails aborted!
Errno::ENOSYS: Function not implemented - Failed to initialize inotify
/usr/local/bundle/gems/rb-inotify-0.10.1/lib/rb-inotify/notifier.rb:69:in `initialize'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/adapter/linux.rb:29:in `new'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/adapter/linux.rb:29:in `_configure'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/adapter/base.rb:47:in `block in configure'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/adapter/base.rb:42:in `each'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/adapter/base.rb:42:in `configure'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/adapter/base.rb:66:in `start'
/usr/local/lib/ruby/2.6.0/forwardable.rb:230:in `start'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/listener.rb:71:in `block in <class:Listener>'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/fsm.rb:124:in `instance_eval'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/fsm.rb:124:in `call'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/fsm.rb:105:in `transition_with_callbacks!'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/fsm.rb:72:in `transition'
/usr/local/bundle/gems/listen-3.7.0/lib/listen/listener.rb:92:in `start'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/evented_file_update_checker.rb:109:in `start'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/evented_file_update_checker.rb:88:in `initialize'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/evented_file_update_checker.rb:44:in `new'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/evented_file_update_checker.rb:44:in `initialize'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/i18n_railtie.rb:64:in `new'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/i18n_railtie.rb:64:in `initialize_i18n'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/i18n_railtie.rb:20:in `block in <class:Railtie>'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/lazy_load_hooks.rb:68:in `block in execute_hook'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/lazy_load_hooks.rb:61:in `with_execution_control'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/lazy_load_hooks.rb:66:in `execute_hook'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/lazy_load_hooks.rb:52:in `block in run_load_hooks'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/lazy_load_hooks.rb:51:in `each'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/lazy_load_hooks.rb:51:in `run_load_hooks'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/application/finisher.rb:140:in `block in <module:Finisher>'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/initializable.rb:32:in `instance_exec'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/initializable.rb:32:in `run'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/initializable.rb:61:in `block in run_initializers'
/usr/local/lib/ruby/2.6.0/tsort.rb:228:in `block in tsort_each'
/usr/local/lib/ruby/2.6.0/tsort.rb:350:in `block (2 levels) in each_strongly_connected_component'
/usr/local/lib/ruby/2.6.0/tsort.rb:431:in `each_strongly_connected_component_from'
/usr/local/lib/ruby/2.6.0/tsort.rb:349:in `block in each_strongly_connected_component'
/usr/local/lib/ruby/2.6.0/tsort.rb:347:in `each'
/usr/local/lib/ruby/2.6.0/tsort.rb:347:in `call'
/usr/local/lib/ruby/2.6.0/tsort.rb:347:in `each_strongly_connected_component'
/usr/local/lib/ruby/2.6.0/tsort.rb:226:in `tsort_each'
/usr/local/lib/ruby/2.6.0/tsort.rb:205:in `tsort_each'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/initializable.rb:60:in `run_initializers'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/application.rb:391:in `initialize!'
/app/config/environment.rb:5:in `<main>'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `require'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `block in require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/loaded_features_index.rb:92:in `register'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:22:in `require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:31:in `require'
/usr/local/bundle/gems/zeitwerk-2.4.2/lib/zeitwerk/kernel.rb:34:in `require'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/dependencies.rb:332:in `block in require'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/dependencies.rb:299:in `load_dependency'
/usr/local/bundle/gems/activesupport-6.1.4.1/lib/active_support/dependencies.rb:332:in `require'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/application.rb:367:in `require_environment!'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/application.rb:533:in `block in run_tasks_blocks'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:281:in `block in execute'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:281:in `each'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:281:in `execute'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
/usr/local/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:243:in `block in invoke_prerequisites'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:241:in `each'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:241:in `invoke_prerequisites'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:218:in `block in invoke_with_call_chain'
/usr/local/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:243:in `block in invoke_prerequisites'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:241:in `each'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:241:in `invoke_prerequisites'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:218:in `block in invoke_with_call_chain'
/usr/local/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:243:in `block in invoke_prerequisites'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:241:in `each'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:241:in `invoke_prerequisites'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:218:in `block in invoke_with_call_chain'
/usr/local/lib/ruby/2.6.0/monitor.rb:235:in `mon_synchronize'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/task.rb:188:in `invoke'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/application.rb:160:in `invoke_task'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/application.rb:116:in `block (2 levels) in top_level'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/application.rb:116:in `each'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/application.rb:116:in `block in top_level'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/application.rb:125:in `run_with_threads'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/application.rb:110:in `top_level'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/commands/rake/rake_command.rb:24:in `block (2 levels) in perform'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/application.rb:186:in `standard_exception_handling'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/commands/rake/rake_command.rb:24:in `block in perform'
/usr/local/bundle/gems/rake-13.0.6/lib/rake/rake_module.rb:59:in `with_application'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/commands/rake/rake_command.rb:18:in `perform'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/command.rb:50:in `invoke'
/usr/local/bundle/gems/railties-6.1.4.1/lib/rails/commands.rb:18:in `<main>'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `require'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `block in require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/loaded_features_index.rb:92:in `register'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:22:in `require_with_bootsnap_lfi'
/usr/local/bundle/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:31:in `require'
/app/bin/rails:5:in `<top (required)>'
/usr/local/bundle/gems/spring-3.0.0/lib/spring/client/rails.rb:28:in `load'
/usr/local/bundle/gems/spring-3.0.0/lib/spring/client/rails.rb:28:in `call'
/usr/local/bundle/gems/spring-3.0.0/lib/spring/client/command.rb:7:in `call'
/usr/local/bundle/gems/spring-3.0.0/lib/spring/client.rb:30:in `run'
/usr/local/bundle/gems/spring-3.0.0/bin/spring:49:in `<top (required)>'
/usr/local/bundle/gems/spring-3.0.0/lib/spring/binstub.rb:11:in `load'
/usr/local/bundle/gems/spring-3.0.0/lib/spring/binstub.rb:11:in `<top (required)>'
/usr/local/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/usr/local/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/app/bin/spring:10:in `block in <top (required)>'
/app/bin/spring:7:in `tap'
/app/bin/spring:7:in `<top (required)>'
bin/rails:2:in `load'
bin/rails:2:in `<main>'
Tasks: TOP => db:setup => db:create => db:load_config => environment
```
----

OK pattern, without listen gem
with
```
config/environments/development.rb
config.file_watcher = ActiveSupport::FileUpdateChecker
```

then
```
$ docker-compose run -e SKIP_TEST_DATABASE=true web bin/rails db:setup --trace
[+] Running 1/0
 ⠿ Container tmp-m1-rb-fsevent-db-1  Running                                                                                                              0.0s
** Invoke db:setup (first_time)
** Invoke db:create (first_time)
** Invoke db:load_config (first_time)
** Invoke environment (first_time)
** Execute environment
** Execute db:load_config
** Execute db:create
Database 'tmp_m1_rb_fsevent_development' already exists
** Invoke environment 
** Invoke db:schema:load (first_time)
** Invoke db:load_config 
** Invoke db:check_protected_environments (first_time)
** Invoke db:load_config 
** Execute db:check_protected_environments
** Execute db:schema:load
** Invoke db:seed (first_time)
** Invoke db:load_config 
** Execute db:seed
** Invoke db:abort_if_pending_migrations (first_time)
** Invoke db:load_config 
** Execute db:abort_if_pending_migrations
** Execute db:setup
```
