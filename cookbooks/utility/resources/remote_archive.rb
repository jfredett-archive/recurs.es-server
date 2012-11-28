actions :unpack
default_action :unpack

attribute :format, required: true
attribute :source, required: true
attribute :destination, default: nil
attribute :user, default: 'root'

