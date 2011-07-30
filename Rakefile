configuration = ENV['CONFIGURATION'] || 'Debug'

task :default => :build

desc "Use rebar to build the application including deps"
task :build_all do
  sh "rebar get-deps compile eunit"
end
desc "Use rebar to build the application"
task :build do
  sh "rebar compile skip_deps=true"
end

desc "Clean the build"
task :clean do
  binDirs = Rake::FileList.new('**/*.beam')
  FileUtils.rm_rf(binDirs);
  FileUtils.rm_rf(".eunit");
end

desc "Run the unit tests with NUnit"
task :test do
	Rake::Task['clean'].invoke
	Rake::Task['build'].invoke
  sh "rebar eunit skip_deps=true"
end

desc "Generate cucumberl as a standalone release"
task :generate do
	sh "rebar generate force=1"
end

desc "Run the cucumberl as a standalone"
task :main do
	sh "CUCUMBERL_CWD=`pwd` sh rel/cucumberl/bin/cucumberl console"
end
