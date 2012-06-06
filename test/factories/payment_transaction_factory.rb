FactoryGirl.define do
  factory :payment_transaction do

    order

    trait :authorizedotnet do
      success 't'
      operation 'authorized'
      amount 11200
      transaction_gid "2172281042"
      params do
        { response_code: 1,
          response_reason_code: "1",
          response_reason_text: "This transaction has been approved.",
          avs_result_code: "Y",
          transaction_id: "2172281042",
          card_code: "P" }
      end
      metadata do
        { card_number: 'XXXX-XXXX-XXXX-0027', cardtype: 'visaa' }
      end
    end

    factory :payment_transaction_with_authorizedotnet,   traits: [ :authorizedotnet ]

  end
end