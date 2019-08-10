ActiveAdmin.register User do
  menu priority: 4
  config.batch_actions = true

  filter :email
  filter :created_at

  permit_params :email, :password

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :password, input_html: { autocomplete: "new-password" }
      f.input :email
    end
    f.actions
  end

end
