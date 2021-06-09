module EditHelper

  def def_quill_props
     {options:
                                                                  {modules:
                                                                       {toolbar:
                                                                            [%w[bold italic underline strike],
                                                                             [{'list': 'ordered'}, {'list': 'bullet'}],
                                                                             [{'align': []}],
                                                                             ['link'],
                                                                             [{'size': ['small', false, 'large', 'huge']}],
                                                                             [{'header': [1, 2, 3, 4, 5, 6, false]}],
                                                                             [{'indent': '-1'}, {'indent': '+1'}],
                                                                             [{'color': []}, {'background': []}],
                                                                             ['clean'],
                                                                             ['image'],
                                                                             ['video']]},
                                                                   theme: 'snow'}}
  end

end
