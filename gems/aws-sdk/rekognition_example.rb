require 'aws-sdk'
require 'optparse'
require 'pp'

def read_file(filename)
  File.read(File.join(File.dirname(__FILE__), '..', '..', 'files', filename))
end

rekognition = Aws::Rekognition::Client.new


resp = rekognition.detect_labels(
    image: {
        bytes: read_file('flamingo.jpg')
    },
    max_labels: 5,
    min_confidence: 90.0
)
pp resp.labels
pp resp.orientation_correction


resp = rekognition.detect_faces(
    image: {
        bytes: read_file('face.jpg')
    },
    attributes: ['ALL'],
)
pp resp.face_details
pp resp.orientation_correction

resp = rekognition.compare_faces(
    source_image: {
        bytes: read_file('face.jpg')
    },
    target_image: {
        bytes: read_file('face2.jpg')
    },
    similarity_threshold: 1.0
)
pp resp.face_matches

resp = rekognition.compare_faces(
    source_image: {
        bytes: read_file('face.jpg')
    },
    target_image: {
        bytes: read_file('face3.jpg')
    },
    similarity_threshold: 1.0
)
pp resp.face_matches

