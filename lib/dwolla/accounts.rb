module Dwolla
    class Accounts
        def self.auto_withdrawl(enabled=true, funding_id=nil, token=nil)
            raise MissingParameterError.new('No Funding ID Provided.') if funding_id.nil?

            url = accounts_url + 'features/auto_withdrawl'
            params = {
                :enabled => enabled,
                :fundingId => funding_id
            }

            Dwolla.request(:post, url, params, {}, token)
        end

        def self.get_autowithdrawal_status(token=nil)

            url = accounts_url + 'features/auto_withdrawal'
            Dwolla.request(:get, url, {}, {}, token)
        end

        private

        def self.accounts_url
            return '/accounts/'
        end
    end
end
