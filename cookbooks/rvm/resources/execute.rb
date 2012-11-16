actions :do
default_action :do

attribute :name, default: '', required:false

attribute :cwd

attribute :user, default: 'rvm'
attribute :environment, default: {}

attribute :code, required: true
attribute :ruby, required: true
attribute :gemset, required: true

