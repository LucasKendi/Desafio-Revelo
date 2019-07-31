module PostsHelper
    def post_status(post)
        "Posted at #{format_date(post.created_at)}" + (post.created_at < post.updated_at ? " and updated at #{format_date(post.updated_at)}" : "")
    end

    def format_date(date)
        I18n.l(date, format: :short)
    end
end