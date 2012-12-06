class FileUploadsController < ApplicationController
  # GET /file_uploads
  # GET /file_uploads.json  

	def index
    @file_uploads = FileUpload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @file_uploads }
    end
  end

  # GET /file_uploads/1
  # GET /file_uploads/1.json
  def show
    @file_upload = FileUpload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @file_upload }
    end
  end

  # GET /file_uploads/new
  # GET /file_uploads/new.json
  def new
    @file_upload = FileUpload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @file_upload }
    end
  end

  # GET /file_uploads/1/edit
  def edit
    @file_upload = FileUpload.find(params[:id])
  end

  # POST /file_uploads
  # POST /file_uploads.json
  def create
    @file_upload = FileUpload.new(params[:file_upload])
	
	#setting new filename bevor saving
	newFileName = Time.now.to_formatted_s(:number)
	if(@file_upload.user_id)
		newFileName = newFileName + "_" + @file_upload.user_id.to_s
	end
	newFileName = newFileName + "_" + @file_upload.file_path.original_filename
	directory = "uploadedFiles/"+newFileName

	#create new file and copie the value
	File.open(directory, "wb"){ |f| f.write(@file_upload.file_path.read) }
	flash[:notice] = "File uploaded to "
	#redirect_to "file_upload/new"
	
	

	@file_upload.file_path = directory
    

	respond_to do |format|
      if @file_upload.save
        format.html { redirect_to @file_upload, notice: 'File upload was successfully created.' }
        format.json { render json: @file_upload, status: :created, location: @file_upload }
      else
        format.html { render action: "new" }
        format.json { render json: @file_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /file_uploads/1
  # PUT /file_uploads/1.json
  def update
    @file_upload = FileUpload.find(params[:id])

    respond_to do |format|
      if @file_upload.update_attributes(params[:file_upload])
        format.html { redirect_to @file_upload, notice: 'File upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @file_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_uploads/1
  # DELETE /file_uploads/1.json
  def destroy
    @file_upload = FileUpload.find(params[:id])
    @file_upload.destroy

    respond_to do |format|
      format.html { redirect_to file_uploads_url }
      format.json { head :no_content }
    end
  end
end
