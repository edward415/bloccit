class FavoriteMailer < ActionMailer::Base
  default from: "edward415@gmail.com"
  
  def new_comment(user, post, comment)
      headers["Message-ID"] = "<comments/#{comment.id}@edbloccit.com>"
      headers["In-Reply-To"] = "<post/#{post.id}@edbloccit.com>"
      headers["References"] = "<post/#{post.id}@edbloccit.com>"
      
      @user = user
      @post = post
      @comment = comment
      
      mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
