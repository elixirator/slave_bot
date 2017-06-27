defmodule Slave.Scheduler do
  use Cronex.Scheduler

  # every :wednesday, at: "9:45" do
  #
  # end

  every :minute do
    Slave.Services.Notes.Publish.run
  end
end
