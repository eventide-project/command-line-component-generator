ENV["LOG_LEVEL"] ||= "info"
ENV["LOG_TAGS"] ||= "_untagged,-data,messaging,entity_projection,entity_store,ignored"
ENV["TEST_BENCH_DETAIL"] ||= "on"

require_relative "../test_init"
