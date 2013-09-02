require 'spec_helper'

describe Feedback do
  let!(:feedback){ Feedback.create name: "author", email: "my@mail.com", 
                                   content: "my feedback", mark: 3 }
  subject { feedback }
  
end
