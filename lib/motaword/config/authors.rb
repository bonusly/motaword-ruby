module Motaword
  module Config
    class Authors
      def self.data
          [{ name:         'Robert Ingrum',
             email:        'robert@bonus.ly',
             organization: 'Bonusly'}]
      end

      def self.names
        data.map { |a| a[:name] }
      end

      def self.emails
        data.map { |a| a[:email] }
      end
    end
  end
end
