configuration = ENV['CONFIGURATION'] || 'Debug'

task :default => :build

desc "Use rebar to build the application"
task :build do
  sh "rebar compile"
end

desc "Use rebar to build the deps"
task :build_deps do
  sh "cd mochiweb;rebar compile"
end

desc "Clean the build"
task :clean do
  binDirs = Rake::FileList.new('*/*.beam')
  FileUtils.rm_rf(binDirs);
  FileUtils.rm_rf(".eunit");
end

desc "Run the unit tests with NUnit"
task :test do
	Rake::Task['clean'].invoke
	Rake::Task['build'].invoke
  sh "rebar eunit"
end

desc "Run the cucumberl as a standalone"
task :main do
	sh "erl -pa ebin -s cucumberl main stop"
end
