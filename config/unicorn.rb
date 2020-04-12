#サーバ上でのアプリケーションコードが設置されているディレクトリを変数に入れておく
RAILS_ROOT = File.expand_path('../../../', __FILE__)
ENV['BUNDLE_GEMFILE'] = RAILS_ROOT + "/Gemfile"
worker_processes 1
# currentを指定
working_directory RAILS_ROOT

# それぞれ、sharedの中を参照するよう変更
listen "#{RAILS_ROOT}/shared/tmp/sockets/unicorn.sock"
pid "#{RAILS_ROOT}/shared/tmp/pids/unicorn.pid"
stderr_path "#{RAILS_ROOT}/shared/log/unicorn.stderr.log"
stdout_path "#{RAILS_ROOT}/shared/log/unicorn.stdout.log"

#Railsアプリケーションの応答を待つ上限時間を設定
timeout 60

#以下は応用的な設定なので説明は割愛

preload_app true
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false # prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end