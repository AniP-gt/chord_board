FactoryBot.define do

  factory :chord, class: Chord  do
    title { "王道進行4536"}
    work {"C,C,D,D,Bm,Bm,Em,Em,"}
    body  {"王道の４５３６進行です"}
    association :user
    created_at {10.minutes.ago}

    trait :yesterday do
      # title { "4536"}
      # work {"C,C,D,D,Bm,Bm,Em,Em,"}
      # body  {"４５３６進行です"}
      created_at {1.day.ago}
      updated_at {1.day.ago}
    end

    trait :now do
      # title { "王道進行"}
      # work {"C,C,D,D,Bm,Bm,Em,Em,"}
      # body  {"王道進行です"}
      created_at {Time.zone.now}
      updated_at {Time.zone.now}
    end

    trait :day_before_yesterday do
      # title { "王道な４５３６進行"}
      # work {"C,C,D,D,Bm,Bm,Em,Em,"}
      # body  {"４５３６進行、王道です"}
      created_at {2.days.ago}
      updated_at {2.days.ago}
    end

  end

end