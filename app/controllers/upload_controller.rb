class UploadController < ApplicationController
  def image
    file = params[:file]
    file_list = []
    code = 0
    msg = '上传成功'
    file_real_path = ''

    if !file.content_type.match(/^image\/(gif|png||jpg||jpeg|){1}$/)
      code = 1
      msg = "#{file.original_filename}:只支持上传JPG,JPEG,GIF,PNG格式图片"
    elsif file.size > 2*1024*1024
      code = 2
      msg = "#{file.original_filename}:图片太大，请上传小于2M的图片"
    end
    if code.zero?
      file_real_path = save_file(file)
      file_list << file_real_path
    end
    logger.info file_real_path
    render :json => {:code=>code, :msg=>msg,:data =>{:src=>"/#{file_real_path}"} }
  end

  private

  def save_file(file)
    extname = file.content_type.match(/^image\/(gif|png|jpg|jpeg){1}$/).to_a[1]
    filename = File.basename(file.original_filename,'.*')
    uri = File.join('uploads', 'images', "#{DateTime.now.strftime('%Y/%m%d/%H%M%S')}_#{SecureRandom.hex(4)}.#{extname}")
    save_path = Rails.root.join('public',uri)
    file_dir = File.dirname(save_path)

    FileUtils.mkdir_p(file_dir) unless Dir.exists?(file_dir)
    File.open save_path, 'wb' do |f|
      f.write(file.read)
      puts save_path
    end
    return uri
  end

  protect_from_forgery :except => :image
  # you can disable csrf protection on controller-by-controller basis:
  skip_before_filter :verify_authenticity_token
end