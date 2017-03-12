module Lita
  module Handlers
    class OnewheelSlackTakeItBack < Handler
      route(/take it back/i,
            :handle_delete)
      route(/Good morning./,
            :handle_cosmos)

      def handle_cosmos(response)
        resp = response.reply "Some text"
        Lita.logger.debug resp.inspect
        redis.set('slack_last', resp)
        redis.set('one', 'two')
        Lita.logger.debug "Redis response: #{m}"
      end

      def handle_delete(response)
        Lita.logger.debug "Hangling delete"
        Lita.logger.debug redis.get('slack_last')
        Lita.logger.debug redis.get('one')
        # response.reply redis.hget('stib', 'last')
      end
    end

    Lita.register_handler(OnewheelSlackTakeItBack)
  end
end
