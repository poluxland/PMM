# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index; end

  def terms; end

  def privacy; end

  def inf; end

  def others; end

  def documentos
    redirect_to "https://drive.google.com/drive/folders/1kWvGZk_45IAC_g0_ue5yeubsosJX203N?usp=share_link"
  end

  def lvs_form
    redirect_to "https://forms.gle/UUPuraCG9NspTmoA7"
  end

  def control_critico_form
    redirect_to "https://forms.gle/3C9iboyujsLDTucR8"
  end

  def envasado_form
    redirect_to "https://forms.gle/VRbBkuBFWZLkgh6s7"
  end

  def barredora_form
    redirect_to "https://forms.gle/Q9YLYJmThy84y15u9"
  end

  def contacto_seguridad_form
    redirect_to "https://forms.gle/cvJ3DF74c3BZCYxU9"
  end
end