#bundle exec rspec spec/models/employee_spec.rb
require 'rails_helper'
RSpec.describe Employee, type: :model do
  it 'メールアドレスが未入力' do
    employee = Employee.new(email: "")
    employee.valid?
    expect(employee.errors[:email]).to include('を入力してください')
  end

  it 'メールアドレスが正しい入力ではない場合' do
    employee = Employee.new(email: 'Eメール')
    employee.valid?
    expect(employee.errors[:email]).to include('は不正な値です')
  end

  it 'パスワードが5文字以下の場合' do
    employee = Employee.new(password: 'pword')
    employee.valid?
    expect(employee.errors[:password]).to include('は6文字以上で入力してください')
  end

end
