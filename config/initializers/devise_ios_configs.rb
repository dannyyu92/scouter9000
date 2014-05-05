module Devise
  module Controllers
    # Helpers used in both FailureApp and Devise controllers.
    module SharedHelpers

      protected

      # Helper used by FailureApp and Devise controllers to retrieve proper formats.
      def request_format
        @request_format ||= if request.format.json?
          :json
        elsif request.format.respond_to?(:ref)
          request.format.ref
        elsif MIME_REFERENCES
          request.format
        elsif request.format # Rails < 3.0.4
          request.format.to_sym
        end
      end

    end
  end
end