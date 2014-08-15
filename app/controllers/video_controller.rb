class VideoController < ApplicationController
  def list
    list_id = params[:id]
    @video_lists = VideoList.all
    if list_id.nil?|| list_id.to_i <= 0
      @videos = Video.all
    else
      @videos = Video.where(:video_list_id => list_id).to_a
      @video_list_name = @video_lists.select{|item| item.id ==list_id.to_i}.first.name
      @video_list_desc = @video_lists.select{|item| item.id ==list_id.to_i}.first.video_list_desc
      @related_keywords = VideoRelatedKeyword.where(:keyword_string => @video_list_name).first
      unless @related_keywords.nil?
        @related_keywords_list = VideoRelatedKeyword.where(:keyword_string => @related_keywords.related_keywords.split(","))
      end
    end
  end
  def show
    id = params[:id] || 1
    @video = Video.find(id)
    @video_lists = VideoList.all
    @related_videos = Video.where(:video_list_id => @video.video_list_id).select{|item| item.id != @video.id && item.id % 5 == @video.id % 5}.take(10)
    @related_keywords = VideoRelatedKeyword.where(:keyword_string => @video.name).first
    unless @related_keywords.nil?
      @related_keywords_list = VideoRelatedKeyword.where(:keyword_string => @related_keywords.related_keywords.split(","))
    end
  end
  def sitemap
    @video_lists = VideoList.all.to_a
    @related_keywords = VideoRelatedKeyword.where(:keyword_string => "高尔夫球").first
    unless @related_keywords.nil?
      @related_keywords_list = VideoRelatedKeyword.where(:keyword_string => @related_keywords.related_keywords.split(","))
    end
  end
end
