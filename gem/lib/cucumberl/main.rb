#!/usr/bin/env ruby

require 'rubygems'
require 'rake'

module Cucumberl
  class Main
    def run(args)
      if ['-h', '-?', '/?', '--help'].include?(args[0])
        show_usage
      else
        launch_cucumberl_process()

        @exit_status = 1
        begin
          cucumber_status = launch_cucumber(args)
          @exit_status = cucumber_status.exitstatus
        ensure
          kill_cucumberl_process
        end
        exit @exit_status
      end
    end

    def launch_cucumberl_process()
      @cucumberl_shell = File.expand_path(File.join(File.dirname(__FILE__), '../../cucumberl/bin/cucumberl'))
      ENV['CUCUMBERL_CWD']="#{Dir.getwd}"
      sh "#{@cucumberl_shell} start"
      ENV['CUCUMBERL_CWD']=""
    end

    def kill_cucumberl_process
      sh "#{@cucumberl_shell} stop"
    end

    def launch_cucumber(args)
      command = "cucumber #{args.join(' ')} 2>&1"
      system(command)
      $?
    end

    def show_usage
      puts "Usage: cucumberl STEP_DEFINITION_DLL_PATH [CUCUMBER_ARGUMENTS]\n\n"
      puts "The following is Cucumber's help. Anything after the cucumber command can be"
      puts "passed in the CUCUMBER_ARGUMENTS argument for cucumberl:\n\n"
      launch_cucumber(['--help'])
    end
  end
end
