module PostsHelper
  def display_post_status(post)
     case post.status
       when "draft"
         "草稿"
       else
         ""
     end
   end
end
