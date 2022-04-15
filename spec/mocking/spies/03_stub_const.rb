# frozen_string_literal: true

#
# Fake sidekiq worker
#
class PushNotificationWorker
  def self.perform_async(*args)
    puts "Sidekiq job started with #{args}"
  end
end

#
# Example for stub with spy
#
class PushNotificationService
  class << self
    # Send message as push notification to users
    #
    # @param [Array<Integer>] user_ids
    # @param [String] message
    def group_send(user_ids, message)
      tokens = find_all_tokens(user_ids)
      tokens.each do |row|
        PushNotificationWorker.perform_async(row[:user_id], row[:token], message)
      end
    end

    def find_all_tokens(user_ids)
      user_ids.map do |user_id|
        {
          user_id: user_id,
          token: "token_#{user_id}"
        }
      end
    end
  end
end

# 我想要測說「described_class 裡面的某個 class 有被 call 到 perform_async」
# 就可以用 stub_const 去 mock 掉一個 class
# Stackoverflow: https://stackoverflow.com/questions/41982953/ruby-rspec-mocking-a-class
# Documentation: https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/mutating-constants/stub-defined-constant
RSpec.describe PushNotificationService do
  let(:push_token) { double(token: 'token_123') }
  let(:push_token2) { double(token: 'token_456') }
  let(:user) { double(id: 123, token: push_token) }
  let(:user2) { double(id: 456, token: push_token2) }
  let(:example_message) { 'Your angel baby is online' }

  describe '.group_send' do
    it 'sends notification' do
      # 我想要測說「裡面的 PushNotificationWorker 有被 call 到 perform_async」
      worker_spy = class_double(PushNotificationWorker)
      allow(worker_spy).to receive(:perform_async).with(any_args)
      stub_const 'PushNotificationWorker', worker_spy

      described_class.group_send([user.id, user2.id], example_message)
      expect(worker_spy).to have_received(:perform_async).with(user.id, user.token.token, example_message)
      expect(worker_spy).to have_received(:perform_async).with(user2.id, user2.token.token, example_message)
    end
  end
end
