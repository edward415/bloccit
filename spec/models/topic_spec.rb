require 'rails_helper'
 
 describe Topic do
   describe "scopes" do
 
     before do 
       @public_topic = Topic.create # default is public
       @private_topic = Topic.create(public: false)
     end
 
     describe "publicly_viewable" do
       it "returns a relation of all public topics" do
         expect(Topic.publicly_viewable).to eq( [@public_topic] )
       end
     end
 
     describe "privately_viewable" do
       it "returns a relation of all private topics" do
         expect(Topic.privately_viewable).to eq( [@private_topic] )
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         user = true # sneaky solution; we don't need a real user, just something truthy
         if user
          expect(Topic.visible_to(user)).to eq( Topic.all )
         end
       end
 
       it "returns only public topics if user is nil" do
         # Your code here
         user = nil
         if user
           expect(Topic.visible_to(user)).to eq( publicly_viewable )
         end
       end
     end
   end
 end