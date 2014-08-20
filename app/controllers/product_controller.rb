require 'product.rb'
require 'video.rb'
class ProductController < ApplicationController
  def list
    category_id = params[:id] || AmazonCategory.pluck(:id).min
    @categories = AmazonCategory.all
    if category_id.nil? || category_id.to_i <= 0
      @products = AmazonProduct.all
    else
      @category = @categories.select{|item| item.id == category_id.to_i}.first
      @products = AmazonProduct.where(:category_id => @category.category_id).to_a
      @category_name = @category.category_name
      @video_list_desc = @category.category_name
      @related_keywords = RelatedKeyword.where(:keyword_string => @category_name).first
      unless @related_keywords.nil?
        @related_keywords_list = RelatedKeyword.where(:keyword_string => @related_keywords.related_keywords.split(","))
      end
    end
  end
  def show
    id = params[:id] || 1
    @product = AmazonProduct.find(id)
    @img_show = 1
    @related_products = AmazonProduct.where("id > ?",id).take(5)
    #render layout: "product"
  end
  def sitemap
    @amazon_products = AmazonProduct.all.to_a
    @related_keywords = RelatedKeyword.where(:keyword_string => "高尔夫球").first
    unless @related_keywords.nil?
      @related_keywords_list = RelatedKeyword.where(:keyword_string => @related_keywords.related_keywords.split(","))
    end
    #render layout: "product"
  end
end
