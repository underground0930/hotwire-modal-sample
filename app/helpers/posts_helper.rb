module PostsHelper
  def turbo_stream_update_flash
    turbo_stream.update "flash", partial: "shared/flash"
  end
end
