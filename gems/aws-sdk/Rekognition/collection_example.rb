require 'aws-sdk'
require 'pp'
require_relative './helper'

rekognition = Aws::Rekognition::Client.new

resp = rekognition.create_collection(collection_id: 'mycollection')
pp resp

begin
  %w(face.jpg face3.jpg).each do |filename|
    resp = rekognition.index_faces(
        collection_id: 'mycollection',
        image: {
            bytes: read_file(filename)
        },
        detection_attributes: ['ALL'],
    )
    pp resp
  end

  resp = rekognition.list_faces(collection_id: 'mycollection')
  pp resp

  resp = rekognition.search_faces_by_image(
      collection_id: 'mycollection',
      image: {
          bytes: read_file('face2.jpg'),
      },
      max_faces: 1,
      face_match_threshold: 50.0,
  )
  pp resp

ensure
  resp = rekognition.delete_collection(collection_id: 'mycollection')
  pp resp
end
