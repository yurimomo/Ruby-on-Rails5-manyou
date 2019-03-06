
require 'rails_helper'

describe 'タスク管理機能' ,type: :system do
		let(:user_g) { FactoryBot.create(:user, name: 'ユーザーG', email: 'g@example.com')}
		let(:user_h) { FactoryBot.create(:user, name: 'ユーザーH', email: 'h@example.com')}
		let(:task_a) { FactoryBot.create(:task, name: '最初のタスク',user: user_g)}

		before do
			FactoryBot.create(:task, name: '最初のタスク', user: user_g)
			visit login_path
			fill_in 'メールアドレス', with: login_user.email
			fill_in 'パスワード', with: login_user.password
			click_button 'ログインする'
		end

		describe '一覧表示機能' do
		 context 'ユーザーGがログインしている時' do
			let(:login_user) { user_g }
			it 'ユーザーGが作成したタスクが表示される' do
				expect(page).to have_content '最初のタスク'
			end
		end

		context 'ユーザーHがログインしている時' do
			let(:login_user) { user_h }
			it 'ユーザDが作成したタスクが表示されない' do
				expect(page).to have_no_content '最初のタスク'
			end
		end
	end


	describe '詳細表示機能' do
		context 'ユーザーGがログインしてる時' do
			let(:login_user) { user_g }

			before do
				visit task_path(task_a)
			end

			it 'ユーザーGが作成したタスクが表示される' do
				expect(page).to have_content '最初のタスク'
			end
		end
	end
end
