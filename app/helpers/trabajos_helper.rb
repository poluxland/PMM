module TrabajosHelper
  def calculate_progress_percentage(inicio, termino)
    return 0 unless inicio && termino && inicio <= termino

    total_days = (termino - inicio).to_i
    return 0 if total_days == 0

    elapsed_days = (Date.current - inicio).to_i
    elapsed_days = [0, [elapsed_days, total_days].min].max  # Clamp value between 0 and total_days

    (elapsed_days.to_f / total_days * 100).round(2)
  end
end
