# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ExplanationsChannel < ApplicationCable::Channel
  # def follow(data)
  #   stop_all_streams
  #   stream_from "explanations:#{data['explanation_id'].to_i}"
  # end
  #
  # def unfollow
  #   stop_all_streams
  # end
  #

  def subscribed
    stream_from "explanations_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add (data)
    puts "RECEIVED SOME DATA FROM ACTIONCABLE: #{data}"
    Explanation.create! explanation: data['explanation']
  end
end
