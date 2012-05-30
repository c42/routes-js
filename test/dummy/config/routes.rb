Rails.application.routes.draw do
  root :to => "dummy#index"
  get '/groups/:group_name' => 'dummy#index', :as => :group
  get '/home/projects_partial' => 'dummy#index', :as => :projects_partial
  get '/home/projects_partial/groups/:group_name' => 'dummy#index', :as => :projects_partial_for_group

  ['XmlStatusReport.aspx', 'cctray.xml', 'cc.xml'].each do |route|
    get route, :to => 'dummy#index', :defaults => {:format => 'xml'}
  end

  get '/projects/:project_name' => 'dummy#index', :as => :project
  post '/projects/:project_name/builds' => 'dummy#index', :as => :project_force
  put '/projects/:project_name/builds/:build_number/cancel' => 'dummy#index', :as => :build_cancel

  get '/projects/:project_name/builds/:build_number' => 'dummy#index', :as => :project_build
  get '/projects/:project_name/builds/:build_number/artefacts/:path' => 'dummy#index', :constraints => {:path => /.*/}, :as => :project_build_artefact
  get '/something/:id' => "dummy#index", :constraints => { :id => /\d+/}, :as => :something
end
