@primary_color = '3C3C3C'
@secondary_color = '6D6D6D'

prawn_document do |pdf|
  pdf.stroke_color @primary_color

  pdf.stroke_horizontal_rule
  pdf.move_down 20

  pdf.bounding_box [pdf.bounds.left + (pdf.bounds.width / 2), pdf.bounds.top - 25], width: 150 do
    pdf.image @logo, fit: [150, 75]
  end

  pdf.move_down 30

  pdf.text "Termo de Autorização de Anestesia e/ou Sedação", size: 24, style: :bold, align: :center,
                                                             color: @primary_color

  pdf.stroke_horizontal_rule
  pdf.move_down 30

  pdf.text "Eu, #{@customer.full_name}, portador do CPF #{@customer.registry_code}
e residente no endereço de CEP #{@customer.zip_code}, neste ato, autorizo a realização do procedimento de anestesia e/ou sedação, conforme descrito abaixo:", size: 14
  pdf.move_down 20

  pdf.text "1. DETALHES DO SERVIÇO", size: 14, style: :bold,
                                     color: @secondary_color
  pdf.text "1.1 Descrição do serviço contratado:", size: 14
  pdf.text "O serviço contratado consiste na aplicação de anestesia e/ou sedação, conforme indicação do médico responsável, durante procedimento cirúrgico ou diagnóstico, conforme as necessidades e particularidades do caso.",
           size: 14
  pdf.text "1.2 Termos e condições aplicáveis:", size: 14
  pdf.text "O procedimento será realizado por médico anestesiologista qualificado e capacitado, e serão adotados todos os procedimentos necessários para garantir a segurança e o bem-estar do paciente.",
           size: 14
  pdf.move_down 20

  pdf.text "2. INFORMAÇÕES DE CONTATO", size: 14, style: :bold,
                                        color: @secondary_color
  pdf.text "Código de identificação: #{@customer.identification_code}",
           size: 14
  pdf.text "Número de telefone: #{@customer.phone_number}", size: 14
  pdf.move_down 20

  pdf.text "3. ASSINATURA DO CLIENTE", size: 14, style: :bold, color: @secondary_color
  pdf.text "Por meio desta, #{@customer.full_name}, declaro estar ciente e de acordo com todos os termos e condições apresentados neste contrato, autorizando a realização do procedimento de anestesia e/ou sedação.",
           size: 14
  pdf.move_down 20

  pdf.text "Cliente:", size: 16, style: :bold, color: @secondary_color
  pdf.move_down 10
  pdf.stroke_horizontal_rule
  pdf.move_down 10
  pdf.text "Assinatura do cliente", size: 12, color: @secondary_color

  pdf.move_down 100

  pdf.text "4. ASSINATURA DO MÉDICO", size: 14, style: :bold, color: @secondary_color
  pdf.text "Declaro que o paciente foi informado e esclarecido sobre o procedimento de anestesia e/ou sedação, tendo compreendido os riscos e benefícios envolvidos, bem como as alternativas terapêuticas disponíveis. Além disso, declaro que foram esclarecidos ao paciente todos os termos e condições do presente contrato e que o mesmo se encontra apto a autorizar a realização do procedimento.",
           size: 14

  pdf.move_down 20

  pdf.text "Médico responsável:", size: 16, style: :bold, color: @secondary_color
  pdf.move_down 10
  pdf.stroke_horizontal_rule
  pdf.move_down 10
  pdf.text "Assinatura do médico", size: 12, color: @secondary_color

  pdf.move_down 20

  pdf.text "Agradecemos pela escolha de nossos serviços e colocamo-nos à disposição para quaisquer esclarecimentos.",
           size: 16, style: :italic, align: :center, color: @secondary_color
end
