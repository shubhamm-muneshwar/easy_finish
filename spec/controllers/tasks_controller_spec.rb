require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before :each do
      @user=create(:user)
      sign_in @user
  end

  # index action
  describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign user instance variable' do
      expect(assigns[:tasks]).to eq(@user.tasks)
    end
  end

  # new action
  describe 'GET #new' do
    before do
      get :new
    end

    it 'is expected to assign user as new instance variable' do
      expect(assigns[:task]).to be_instance_of(Task)
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

  # create action
  describe 'POST #create' do
    before do
      post :create, params: params
    end

    context 'when params are correct' do
      let(:params) { { task: { title: "Reminder Title", notes: "New Notes", end_date: DateTime.now + 10.days, task_status_id: 1, user_id: @user.id } } }

      it 'is expected to create new user successfully' do
        expect(assigns[:task]).to be_instance_of(Task)
      end

      it 'is expected to have title assigned to it' do
        expect(assigns[:task].title).to eq('Reminder Title')
      end
    end
  end

  # # edit action
  # describe 'GET #edit' do
  #   before do
  #     get :edit, params: params
  #   end
  #
  #   context 'when task id is valid' do
  #     let(:task) { create(:task) }
  #     let(:params) { { id: task.id } }
  #
  #     it 'is expected to set task instance variable' do
  #       expect(assigns[:task]).to eq(User.find_by(id: params[:id]))
  #     end
  #
  #     it 'is expected to render edit template' do
  #       is_expected.to render_template(:edit)
  #     end
  #   end
  #
  #   context 'when task id is invalid' do
  #     let(:params) { { id: 0 } }
  #
  #     it 'is expected to redirect_to tasks path' do
  #       is_expected.to redirect_to(tasks_path)
  #     end
  #
  #     it 'is expected to set flash' do
  #       expect(flash[:notice]).to eq("Couldn't find Task with 'id'=0")
  #     end
  #   end
  #
  # end

  # # update action
  # describe 'PATCH #update' do
  #
  #   before do
  #     # something that you want to execute before running `it` block
  #     patch :update, params: params
  #   end
  #
  #   context 'when task not found' do
  #     let(:params) { { id: Faker::Number.number } }
  #
  #     it 'is expected to redirect_to tasks path' do
  #       is_expected.to redirect_to(tasks_path)
  #     end
  #
  #     it 'is expected to set flash' do
  #       expect(flash[:notice]).to eq('User not found.')
  #     end
  #   end
  #
  #   context 'when task exist in database' do
  #     let(:task) { FactoryBot.create :task }
  #     let(:params) { { id: task.id, task: { name: 'test name' } } }
  #
  #     context 'when data is provided is valid' do
  #       it 'is expected to update task' do
  #         expect(task.reload.name).to eq('test name')
  #       end
  #
  #       it 'is_expected to redirect_to tasks_path' do
  #         is_expected.to redirect_to(tasks_path)
  #       end
  #
  #       it 'is expected to set flash message' do
  #         expect(flash[:notice]).to eq('User has been updated Successfully.')
  #       end
  #     end
  #
  #     context 'when data is invalid' do
  #       let(:task) { FactoryBot.create :task }
  #       let(:params) { { id: task.id, task: { name: '' } } }
  #
  #       it 'is expected not to update task name' do
  #         expect(task.reload.name).not_to be_empty
  #       end
  #
  #       it 'is expected to render edit template' do
  #         expect(response).to render_template(:edit)
  #       end
  #
  #       it 'is expected to add errors to task name attribute' do
  #         expect(assigns[:task].errors[:name]).to eq(['can\'t be blank'])
  #       end
  #     end
  #   end
  # end

end
