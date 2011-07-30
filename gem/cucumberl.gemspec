# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cucumberl}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Oliver Ferrigni"]
  s.date = %q{2011-07-30}
  s.default_executable = %q{cucumberl}
  s.description = %q{Runs Cucumber with Erlang step definitions.}
  s.email = %q{oliver.ferrigni@gmail.com}
  s.executables = ["cucumberl"]
  s.files = [
    "./Rakefile",
    "./VERSION",
    "./bin/cucumberl",
    "./cucumberl.gemspec",
    "./cucumberl/bin/cucumberl",
    "./cucumberl/erts-5.8.4/bin/beam",
    "./cucumberl/erts-5.8.4/bin/beam.smp",
    "./cucumberl/erts-5.8.4/bin/child_setup",
    "./cucumberl/erts-5.8.4/bin/ct_run",
    "./cucumberl/erts-5.8.4/bin/epmd",
    "./cucumberl/erts-5.8.4/bin/erl",
    "./cucumberl/erts-5.8.4/bin/erlc",
    "./cucumberl/erts-5.8.4/bin/erlexec",
    "./cucumberl/erts-5.8.4/bin/escript",
    "./cucumberl/erts-5.8.4/bin/heart",
    "./cucumberl/erts-5.8.4/bin/inet_gethost",
    "./cucumberl/erts-5.8.4/bin/nodetool",
    "./cucumberl/erts-5.8.4/bin/run_erl",
    "./cucumberl/erts-5.8.4/bin/start",
    "./cucumberl/erts-5.8.4/bin/to_erl",
    "./cucumberl/erts-5.8.4/include/driver_int.h",
    "./cucumberl/erts-5.8.4/include/erl_driver.h",
    "./cucumberl/erts-5.8.4/include/erl_drv_nif.h",
    "./cucumberl/erts-5.8.4/include/erl_fixed_size_int_types.h",
    "./cucumberl/erts-5.8.4/include/erl_int_sizes_config.h",
    "./cucumberl/erts-5.8.4/include/erl_memory_trace_parser.h",
    "./cucumberl/erts-5.8.4/include/erl_nif.h",
    "./cucumberl/erts-5.8.4/include/erl_nif_api_funcs.h",
    "./cucumberl/erts-5.8.4/include/internal/README",
    "./cucumberl/erts-5.8.4/include/internal/erl_errno.h",
    "./cucumberl/erts-5.8.4/include/internal/erl_memory_trace_protocol.h",
    "./cucumberl/erts-5.8.4/include/internal/erl_misc_utils.h",
    "./cucumberl/erts-5.8.4/include/internal/erl_printf.h",
    "./cucumberl/erts-5.8.4/include/internal/erl_printf_format.h",
    "./cucumberl/erts-5.8.4/include/internal/erts_internal.mk",
    "./cucumberl/erts-5.8.4/include/internal/ethr_atomics.h",
    "./cucumberl/erts-5.8.4/include/internal/ethr_mutex.h",
    "./cucumberl/erts-5.8.4/include/internal/ethr_optimized_fallbacks.h",
    "./cucumberl/erts-5.8.4/include/internal/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/ethread.mk",
    "./cucumberl/erts-5.8.4/include/internal/ethread_header_config.h",
    "./cucumberl/erts-5.8.4/include/internal/gcc/ethr_atomic.h",
    "./cucumberl/erts-5.8.4/include/internal/gcc/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/i386/atomic.h",
    "./cucumberl/erts-5.8.4/include/internal/i386/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/i386/rwlock.h",
    "./cucumberl/erts-5.8.4/include/internal/i386/spinlock.h",
    "./cucumberl/erts-5.8.4/include/internal/libatomic_ops/ethr_atomic.h",
    "./cucumberl/erts-5.8.4/include/internal/libatomic_ops/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/ppc32/atomic.h",
    "./cucumberl/erts-5.8.4/include/internal/ppc32/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/ppc32/rwlock.h",
    "./cucumberl/erts-5.8.4/include/internal/ppc32/spinlock.h",
    "./cucumberl/erts-5.8.4/include/internal/pthread/ethr_event.h",
    "./cucumberl/erts-5.8.4/include/internal/sparc32/atomic.h",
    "./cucumberl/erts-5.8.4/include/internal/sparc32/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/sparc32/rwlock.h",
    "./cucumberl/erts-5.8.4/include/internal/sparc32/spinlock.h",
    "./cucumberl/erts-5.8.4/include/internal/sparc64/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/tile/atomic.h",
    "./cucumberl/erts-5.8.4/include/internal/tile/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/win/ethr_atomic.h",
    "./cucumberl/erts-5.8.4/include/internal/win/ethr_event.h",
    "./cucumberl/erts-5.8.4/include/internal/win/ethread.h",
    "./cucumberl/erts-5.8.4/include/internal/x86_64/ethread.h",
    "./cucumberl/erts-5.8.4/lib/internal/README",
    "./cucumberl/erts-5.8.4/lib/internal/liberts_internal.a",
    "./cucumberl/erts-5.8.4/lib/internal/liberts_internal_r.a",
    "./cucumberl/erts-5.8.4/lib/internal/libethread.a",
    "./cucumberl/erts-5.8.4/lib/liberts.a",
    "./cucumberl/erts-5.8.4/lib/liberts_r.a",
    "./cucumberl/erts-5.8.4/src/setuid_socket_wrap.c",
    "./cucumberl/etc/app.config",
    "./cucumberl/etc/vm.args",
    "./cucumberl/lib/compiler-4.7.3.ez",
    "./cucumberl/lib/crypto-2.0.2.1.ez",
    "./cucumberl/lib/crypto-2.0.2.1/priv/lib/crypto.so",
    "./cucumberl/lib/crypto-2.0.2.1/priv/obj/Makefile",
    "./cucumberl/lib/crypto-2.0.2.1/priv/obj/crypto.o",
    "./cucumberl/lib/cucumberl-1.ez",
    "./cucumberl/lib/edoc-0.7.7.ez",
    "./cucumberl/lib/edoc-0.7.7/include/edoc_doclet.hrl",
    "./cucumberl/lib/edoc-0.7.7/priv/edoc.dtd",
    "./cucumberl/lib/edoc-0.7.7/priv/edoc_generate",
    "./cucumberl/lib/edoc-0.7.7/priv/erlang.png",
    "./cucumberl/lib/edoc-0.7.7/priv/stylesheet.css",
    "./cucumberl/lib/erts-5.8.4.ez",
    "./cucumberl/lib/et-1.4.2.ez",
    "./cucumberl/lib/et-1.4.2/include/et.hrl",
    "./cucumberl/lib/gs-1.5.13.ez",
    "./cucumberl/lib/gs-1.5.13/priv/bitmap/fup.bm",
    "./cucumberl/lib/gs-1.5.13/priv/gs-xdefaults",
    "./cucumberl/lib/gs-1.5.13/priv/gstk.tcl",
    "./cucumberl/lib/hipe-3.7.9.ez",
    "./cucumberl/lib/inets-5.5.2.ez",
    "./cucumberl/lib/inets-5.5.2/include/httpd.hrl",
    "./cucumberl/lib/inets-5.5.2/include/mod_auth.hrl",
    "./cucumberl/lib/inets-5.5.2/priv/bin/runcgi.sh",
    "./cucumberl/lib/kernel-2.14.4.ez",
    "./cucumberl/lib/kernel-2.14.4/include/file.hrl",
    "./cucumberl/lib/kernel-2.14.4/include/inet.hrl",
    "./cucumberl/lib/kernel-2.14.4/include/inet_sctp.hrl",
    "./cucumberl/lib/mnesia-4.4.17.ez",
    "./cucumberl/lib/mochiweb-2.0.0.ez",
    "./cucumberl/lib/mochiweb-2.0.0/include/internal.hrl",
    "./cucumberl/lib/observer-0.9.9.ez",
    "./cucumberl/lib/observer-0.9.9/include/etop.hrl",
    "./cucumberl/lib/observer-0.9.9/priv/bin/cdv",
    "./cucumberl/lib/observer-0.9.9/priv/bin/cdv.bat",
    "./cucumberl/lib/observer-0.9.9/priv/bin/etop",
    "./cucumberl/lib/observer-0.9.9/priv/bin/etop.bat",
    "./cucumberl/lib/observer-0.9.9/priv/bin/getop",
    "./cucumberl/lib/observer-0.9.9/priv/bin/getop.bat",
    "./cucumberl/lib/observer-0.9.9/priv/crashdump_viewer.tool",
    "./cucumberl/lib/observer-0.9.9/priv/crashdump_viewer/collapsd.gif",
    "./cucumberl/lib/observer-0.9.9/priv/crashdump_viewer/exploded.gif",
    "./cucumberl/lib/public_key-0.11.ez",
    "./cucumberl/lib/public_key-0.11/include/OTP-PUB-KEY.hrl",
    "./cucumberl/lib/public_key-0.11/include/public_key.hrl",
    "./cucumberl/lib/runtime_tools-1.8.5.ez",
    "./cucumberl/lib/runtime_tools-1.8.5/include/observer_backend.hrl",
    "./cucumberl/lib/runtime_tools-1.8.5/priv/lib/trace_file_drv.so",
    "./cucumberl/lib/runtime_tools-1.8.5/priv/lib/trace_ip_drv.so",
    "./cucumberl/lib/sasl-2.1.9.3.ez",
    "./cucumberl/lib/ssl-4.1.4.ez",
    "./cucumberl/lib/ssl-4.1.4/priv/bin/ssl_esock",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/Makefile",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/debuglog.o",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/esock.o",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/esock_openssl.o",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/esock_osio.o",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/esock_poll.o",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/esock_posix_str.o",
    "./cucumberl/lib/ssl-4.1.4/priv/obj/esock_utils.o",
    "./cucumberl/lib/stdlib-1.17.4.ez",
    "./cucumberl/lib/stdlib-1.17.4/include/erl_bits.hrl",
    "./cucumberl/lib/stdlib-1.17.4/include/erl_compile.hrl",
    "./cucumberl/lib/stdlib-1.17.4/include/ms_transform.hrl",
    "./cucumberl/lib/stdlib-1.17.4/include/qlc.hrl",
    "./cucumberl/lib/stdlib-1.17.4/include/zip.hrl",
    "./cucumberl/lib/syntax_tools-1.6.7.ez",
    "./cucumberl/lib/tools-2.6.6.3.ez",
    "./cucumberl/lib/tools-2.6.6.3/priv/cover.tool",
    "./cucumberl/lib/tools-2.6.6.3/priv/index.html",
    "./cucumberl/lib/webtool-0.8.7.ez",
    "./cucumberl/lib/webtool-0.8.7/priv/bin/start_webtool",
    "./cucumberl/lib/webtool-0.8.7/priv/bin/start_webtool.bat",
    "./cucumberl/lib/webtool-0.8.7/priv/root/conf/mime.types",
    "./cucumberl/lib/webtool-0.8.7/priv/root/doc/index.html",
    "./cucumberl/lib/webtool-0.8.7/priv/root/doc/start_info.html",
    "./cucumberl/lib/webtool-0.8.7/priv/root/doc/tool_management.html",
    "./cucumberl/lib/wx-0.98.9.ez",
    "./cucumberl/lib/wx-0.98.9/include/gl.hrl",
    "./cucumberl/lib/wx-0.98.9/include/glu.hrl",
    "./cucumberl/lib/wx-0.98.9/include/wx.hrl",
    "./cucumberl/lib/wx-0.98.9/priv/erl_gl.so",
    "./cucumberl/lib/wx-0.98.9/priv/erlang-logo32.png",
    "./cucumberl/lib/wx-0.98.9/priv/erlang-logo64.png",
    "./cucumberl/lib/wx-0.98.9/priv/wxe_driver.so",
    "./cucumberl/lib/xmerl-1.2.8.ez",
    "./cucumberl/lib/xmerl-1.2.8/include/xmerl.hrl",
    "./cucumberl/lib/xmerl-1.2.8/include/xmerl_xlink.hrl",
    "./cucumberl/lib/xmerl-1.2.8/include/xmerl_xpath.hrl",
    "./cucumberl/lib/xmerl-1.2.8/include/xmerl_xsd.hrl",
    "./cucumberl/log/erlang.log.1",
    "./cucumberl/log/run_erl.log",
    "./cucumberl/log/sasl-error.log",
    "./cucumberl/log/sasl/1",
    "./cucumberl/log/sasl/2",
    "./cucumberl/log/sasl/3",
    "./cucumberl/log/sasl/4",
    "./cucumberl/log/sasl/index",
    "./cucumberl/main.rb",
    "./cucumberl/releases/1/cucumberl.boot",
    "./cucumberl/releases/1/cucumberl.rel",
    "./cucumberl/releases/1/cucumberl.script",
    "./cucumberl/releases/1/start_clean.boot",
    "./cucumberl/releases/1/start_clean.rel",
    "./cucumberl/releases/1/start_clean.script",
    "./cucumberl/releases/start_erl.data",
    "./lib/cucumberl/main.rb",
    "./pkg/cucumberl-0.1.0.gem",
    "Rakefile",
    "VERSION",
    "cucumberl/main.rb"
  ]
  s.homepage = %q{http://github.com/oferrigni/cucumberl}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Cucumber for Erlang}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>, [">= 0.5.2"])
    else
      s.add_dependency(%q<cucumber>, [">= 0.5.2"])
    end
  else
    s.add_dependency(%q<cucumber>, [">= 0.5.2"])
  end
end

