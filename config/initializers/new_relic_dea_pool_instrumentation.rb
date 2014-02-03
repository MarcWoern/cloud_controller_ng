require 'new_relic/agent/method_tracer'
require 'cloud_controller/dea/dea_pool'

module CCInitializers
  def self.new_relic_dea_pool_instrumentation(_)
    VCAP::CloudController::DeaPool.class_eval do
      include ::NewRelic::Agent::MethodTracer

      %w(
        find_dea
      ).each do |method_name|
        add_method_tracer(method_name)
      end
    end
  end
end
