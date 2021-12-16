GistStruct = Struct.new(:gist_url) do
      def success?
        gist_url.present?
      end

      def get_gist_url
        gist_url
      end
    end