ActiveAdmin.register Contact do
  menu parent: "Настройки", label: 'Контакты'
  permit_params :name, :value, :icon
 
end
