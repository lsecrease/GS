class RepoController < ApplicationController
    before_filter :search_repos
    
    def index
    render json: {
      repos: @repos,
      meta: {
        current_page: @repos.current_page,
        next_page: @repos.next_page,
        prev_page: @repos.prev_page,
        total_pages: @repos.total_pages,
        total_count: @repos.total_count
      }
    }
    end
    
    
private

  def search_repos
    @repos =  if params[:search].present?
      Repo.search(params[:search])
    else
      Repo.all
    end.sorted.page(params[:page])
  end
end