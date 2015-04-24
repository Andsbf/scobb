class RegistrationSerializer < ActiveModel::Serializer
  attributes(*Registration.attribute_names.map(&:to_sym),:dependant, :client, :payment, :course)

   def dependant
     self.dependant_id
   end

   def client
     self.client_id
   end
   
   def payment
     self.payment_id
   end

   def course
     self.course_id
   end
end
