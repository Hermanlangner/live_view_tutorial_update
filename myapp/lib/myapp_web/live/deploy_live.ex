defmodule MyappWeb.DeployLive do
  use MyappWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, deploy_step: "Ready!")}
  end

  def handle_event("github_deploy", _value, socket) do
    #:ok = MyappWeb.start_deploy()
    IO.puts "foo" ; :timer.sleep(1000); IO.puts "bar"
    send(self(), :create_org)
    {:noreply, assign(socket, deploy_step: "Starting deploy...")}
  end

  def handle_info(:create_org, socket) do
  #  {:ok, org} = MyappWeb.create_org()
  IO.puts "foo" ; :timer.sleep(1000); IO.puts "bar"
    send(self(), {:create_repo, "org"})
    {:noreply, assign(socket, deploy_step: "Creating GitHub org...")}
  end

  def handle_info({:create_repo, repo}, socket) do
  #  {:ok, repo} = MyappWeb.create_repo(org)
  IO.puts "foo" ; :timer.sleep(1000); IO.puts "bar"
    send(self(), {:push_contents, "repo"})
    {:noreply, assign(socket, deploy_step: "Creating GitHub repo...")}
  end

  def handle_info({:push_contents, repo}, socket) do
   # :ok = MyappWeb.push_contents(repo)
   IO.puts "foo" ; :timer.sleep(1000); IO.puts "bar"
    send(self(), :done)
    {:noreply, assign(socket, deploy_step: "Pushing to repo...")}
  end

  def handle_info(:done, socket) do
    IO.puts "foo" ; :timer.sleep(1000); IO.puts "bar"
    {:noreply, assign(socket, deploy_step: "Done!")}
  end
end
