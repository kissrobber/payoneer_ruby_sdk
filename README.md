# Payoneer Ruby SDK

Payoneer Ruby SDK.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'payoneer_ruby_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payoneer_ruby_sdk

## Configuration

```ruby
Payoneer.configure({
  partner_username: '<payoneer_username>',
  partner_api_password: '<payoneer_api_password>',
  partner_id: '<payoneer_partner_id>',
  program_id: '<payoneer_program_id>',
  env: 'production'
})
```

## Usage

### General APIs

#### Echo
```ruby
Payoneer::Api::Echo.request
```

#### GetVersion
```ruby
Payoneer::Api::GetVersion.request
```

### Payee Registration

#### Payee Sign-up
```ruby
Payoneer::Api::GetToken.request(payee_id: 1000011)
Payoneer::Api::GetToken.request(payee_id: 1000011, payout_methods: 'prepaidcard')
Payoneer::Api::GetToken.request(payee_id: 1000011, redirect_url: 'http://example.com', redirect_time: 5)
```

#### Payee Sign-up / Auto Population
```ruby
data = '<?xml version="1.0" encoding="utf-8"?>
<PayoneerDetails>
 <Details>
 <apuid>123</apuid>
 <sessionid></sessionid>
 <redirect></redirect>
 <redirectTime></redirectTime>
 <PayoutMethodList></PayoutMethodList>
 <RegMode></RegMode>
 </Details>
 <PersonalDetails>
 <firstName></firstName>
 <lastName></lastName>
 <dateOfBirth></dateOfBirth>
 <address1></address1>
 <address2></address2>
 <city></city>
 <country></country>
 <state></state>
 <zipCode></zipCode>
 <mobile></mobile>
 <phone></phone>
 <email></email>
 </PersonalDetails>
</PayoneerDetails>
'
Payoneer::Api::GetTokenXml.request(xml: data)
```

### Payees

#### Get Payee Details
```ruby
Payoneer::Api::GetPayeeDetails.request(payee_id: 1000011)
```

#### Get Single Payee Report
```ruby
Payoneer::Api::GetSinglePayeeReport.request(payee_id: 1000011)
```

#### Get Payees Report
```ruby
Payoneer::Api::GetPayeesReport.request(start_date: '2015/09/01', end_date: '2015/10/2')
```

#### Change Payee Id
```ruby
Payoneer::Api::ChangePayeeId.request(old_payee_id: 1000002, new_payee_id: 2000002)
```

### Perform a Payment

#### Perform Payout Payment
```ruby
Payoneer::Api::PerformPayoutPayment.request(payment_id: 1, payee_id: 2000002, amount: 20, description: 'unko', currency: 'USD', payment_date: '2015/10/2')
```

### Payments

#### Cancel Payment
```ruby
Payoneer::Api::CancelPayment.request(payment_id: 1)
```

#### Get Payment Status
```ruby
Payoneer::Api::GetPaymentStatus.request(payee_id: 1000011, payment_id: 1)
```

#### Get Unclaimed Payments XML
```ruby
Payoneer::Api::GetUnclaimedPaymentsXML.request
```

#### Get Unclaimed Payments CSV
```ruby
Payoneer::Api::GetUnclaimedPaymentsCSV.request
```

### Account

#### Get Account Details
```ruby
Payoneer::Api::GetAccountDetails.request
```

## Contributing

1. Fork it ( https://github.com/kissrobber/payoneer_ruby_sdk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
