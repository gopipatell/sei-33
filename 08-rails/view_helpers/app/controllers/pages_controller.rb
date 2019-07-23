class PagesController < ApplicationController
  def home
  end

  def numbers
    @amount = 232938.28743
    @large_number = 239343498
    @phone = 2125551212
  end

  def text
    @numbers = (1..20).to_a.shuffle
    @friend_count = 1
    @enemy_count = 11
    @story = "A very very very very very very very very long time ago in a galaxy far far far far far far far far away."
  end
end
