class Api::MembersController < ApplicationController
  before_action :authenticate_v1_user!
  def index
    members = Member.all

    render json: {
      members: members
    }, status: :ok
  end

  def show
    @member = Member.find(params[:id])
    render json: {
      member: @member
    }, status: :ok
  end

  def create
    member = Member.new(member_params)
    member.save
    render json: {
      member: member
    }, status: :ok
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    render json: {
      member: @member
    }, status: :ok
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    render json: {
      member: @members
    }, status: :ok
  end

  private
  def member_params
    params.require(:member).permit()
  end

end
