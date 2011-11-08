module Mongoid::ActiveRecordBridge
  extend ActiveSupport::Concern

  module ClassMethods
    def attach_mongoid_document(klass_sym, options = {})
      mongo_document_finder(klass_sym)

      mongo_document_creater(klass_sym) if options[:create]
    end

    private
    def mongo_document_finder(klass_sym)
      define_method(klass_sym) {
        constant = klass_sym.to_s.camelize.constantize
        constant.find(self.bson_id)
      }
    end

    def mongo_document_creater(klass_sym)
      before_create :"create_#{klass_sym}"
      define_method("create_#{klass_sym}") {
        constant = klass_sym.to_s.camelize.constantize
        self.bson_id = constant.create.id
      }
    end
  end
end
