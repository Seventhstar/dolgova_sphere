ActiveAdmin.register Price do
  menu parent: "Прайс", label: 'Прайс'
  permit_params :course_id, :staff_id, :tarif_id, :amount

  # form do |f|
  #   f.inputs do
  #
  #   end
  
end
