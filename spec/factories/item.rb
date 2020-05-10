FactoryBot.define do
  factory :item do
    name                  {"俺は匡史"}
    content               {"落ちろよおおおおおおお"}
    condition_id          {3}
    category_id           {89}
    size_id               {3}
    delivery_fee_id       {2}
    delivery_way_id       {1}
    prefecture_id         {1}
    delivery_date_id      {1}
    price                 {8000}
  end
end