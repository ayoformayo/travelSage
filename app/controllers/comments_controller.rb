class CommentsController < ApplicationController
  def create

    article = Article.find(params['article']['id'])
    # fix user_id
    @comment = Comment.create(text: params['comment']['text'], user_id: 11, commentable_type: "Article", commentable_id: article.id)
    # comment.user_id = current_user.id
    render :partial => 'comment'

    # redirect_to article_path(14)
  end
end
