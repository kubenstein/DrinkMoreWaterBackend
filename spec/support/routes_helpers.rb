def stub_erb!
  allow_any_instance_of(Sinatra::Application).to receive(:erb).and_return({})
end

def stub_workflow_with!(fake_workflow)
  allow_any_instance_of(Object).to receive(:use_workflow).and_return(fake_workflow)
end

def expect_workflow(workflow)
  expect_any_instance_of(workflow)
end