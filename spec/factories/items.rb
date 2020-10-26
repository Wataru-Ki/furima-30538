FactoryBot.define do
  factory :item do
    name                {"商品名"}
    price               {12345}
    introduction        {"商品説明"}
    shipping_area_id    {2}
    shipping_date_id    {2}
    shipping_charge_id  {2}
    category_id         {2}
    item_condition_id   {2}
    association :user
  end
end
