#!/usr/bin/env ruby

require 'rubygems'

module Cucumberl
  class Main
    def run(args)
      if ['-h', '-?', '/?', '--help'].include?(args[0])
        show_usage
      else
        launch_cuke4nuke_process()

        @exit_status = 1
        begin
          cucumber_status = launch_cucumber(args)
          @exit_status = cucumber_status.exitstatus
        ensure
          kill_cuke4nuke_process
        end
        exit @exit_status
      end
    end

    def launch_cuke4nuke_process(step_definitions_dll_path)
      @cucumberl_shell = File.expand_path(File.join(File.dirname(__FILE__), '../../release/bin/cucumberl'))
      prefix = "CUCUMBERL_CWD=#{Dir.getwd}"
      sh "#{prefix} #{@cucumberl_shell} start"
    end

    def kill_cuke4nuke_process
      sh "#{@cucumberl_shell} stop"
    end

    def launch_cucumber(args)
      command = "cucumber #{args.join(' ')} 2>&1"
      system(command)
      $?
    end

    def show_usage
      puts "Usage: cucumberl [CUCUMBER_ARGUMENTS]\n\n"
      puts "The following is Cucumber's help. Anything after the cucumber command can be"
      puts "passed in the CUCUMBER_ARGUMENTS argument:\n\n"
      launch_cucumber(['--help'])
    end
  end
end
