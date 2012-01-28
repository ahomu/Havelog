## Monkeypatch to disable connection pooling in ActiveRecord
#module ActiveRecord
#  module ConnectionAdapters
#    class ConnectionPool
#      def checkout
#        c = ActiveRecord::Base.send(spec.adapter_method, spec.config.dup)
#        c.verify!
#        c
#      end
#
#      def checkin(conn)
#        conn.disconnect!
#      end
#
#      # Disable @connection_mutex around these methods
#      [:clear_reloadable_connections!, :verify_active_connections!,
#       :connected?, :disconnect!].each do |m|
#        aliased_method, punctuation = m.to_s.sub(/([?!=])$/, ''), $1
#        alias_method m, "#{aliased_method}_without_synchronization#{punctuation}"
#      end
#    end
#  end
#end