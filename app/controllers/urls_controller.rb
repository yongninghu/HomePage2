class UrlsController < ApplicationController

  def new
  	@url = Url.new
  end
  
  def create
    #render plain: params[:url].inspect
    #going to need a parsing here
    side_size = 300
	crop_side_size = side_size-50 
    @url = Url.new(params[:url].permit(:link))

    if @url.save
    	kit = IMGKit.new(@url.link,
    					:quality => 50,
                      	:width   => side_size,
                      	:height  => side_size,
                      	"crop-h" => crop_side_size,
                      	"disable-smart-width" => true,
                      	"zoom" => 0.2)
    	img = kit.to_img(:png)
    	#file_path = "/home/hai/#{Time.now}file.png"
    	#file1 = kit.to_file(file_path)
    	file = Tempfile.new(["template", '.png'], 'tmp',
                         :encoding => 'ascii-8bit')
    	file.write(img)
   		file.flush
   		@user = User.first
    	@box = @user.boxes.create(url_id: @url.id, isDynamic: false, image: file)
    	@box.save
    	file.unlink
    	redirect_to :controller => 'users', :action => 'show', :id => 1
    end
  end

end
