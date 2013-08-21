module Gitlab::Client::Projects
  def deploy_keys(project, options={})
    get("/projects/#{project}/keys", :query => options)
  end

  def deploy_key(project, id)
    get("/projects/#{project}/keys/id")
  end

  def create_deploy_key(project, title, key)
    post("/projects/#{project}/keys", title: title, key: key)
  end

  def delete_deploy_key(project, key)
    delete("/projects/#{project}/keys/#{key}")
  end
end