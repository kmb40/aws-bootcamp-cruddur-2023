require 'aws-sdk-s3'

def handler(event:, context:)
  s3 = Aws::S3::Resource.new
  bucket_name = ENV["UPLOADS_BUCKET_NAME"]
  object_key = 'mock.jpg'
  
  obj = s3.bucket(bucket_name).object(object_key)
  url = obj.presigned_url(:put, expires_in: 3600)
  url # this is the data that will be returned
  body = {url: url}.to_json
  { statusCode: 200, body: body}
end  