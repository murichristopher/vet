@primary_color = '3C3C3C'  # Cor primária para cabeçalhos e títulos importantes
@secondary_color = '6D6D6D'  # Cor secundária para subtítulos e informações secundárias

prawn_document do |pdf|
  pdf.stroke_color @primary_color

  # Cabeçalho
  pdf.move_down 20
  pdf.text "Comanda de Atendimento", size: 24, style: :bold, align: :center, color: @primary_color
  pdf.stroke_horizontal_rule
  pdf.move_down 20

  # Informações do parceiro com fundo cinza
  pdf.fill_color "EEEEEE"
  pdf.fill_rectangle [pdf.bounds.left, pdf.cursor], pdf.bounds.right, 30
  pdf.fill_color "000000"
  pdf.move_down 10
  pdf.text "PARCEIRO VETUS", size: 18, style: :bold, align: :center, color: @secondary_color
  pdf.move_down 5
  pdf.text "Rua Vicente Bettoni, 123 - Jardim Orly - CEP: 04434-230 - São Paulo", align: :center, size: 12
  pdf.text "Telefone: (11) 9819-31909", align: :center, size: 12
  pdf.move_down 20

  # Dados do atendimento com sublinhado
  pdf.text "Data: 08/02/2024   Usuário: gustavo1234", align: :center, size: 12, style: :bold
  pdf.stroke_horizontal_rule
  pdf.move_down 20

  # Estilização de seções com uso de cores para títulos
  pdf.text "ID: 728   Cliente: bruna   CPF/CNPJ:", size: 12, style: :bold, color: @primary_color
  pdf.text "Endereço:   Bairro:", size: 12
  pdf.text "Complemento:   Referência:", size: 12
  pdf.text "Cidade:   CEP:   Tel:", size: 12
  pdf.move_down 20

  # Informações do animal com estilo em negrito
  pdf.text "Informações do Animal:", size: 14, style: :bold, color: @secondary_color
  pdf.text "Animal: 348 - malu   Idade: Idade não informada", size: 12, style: :bold
  pdf.text "Raça: POODLE TOY   Espécie: CANINA   Sexo: Não Definido", size: 12
  pdf.move_down 20

  # Serviços realizados com background alternativo para destaque
  pdf.fill_color "F7F7F7"
  pdf.fill_rectangle [pdf.bounds.left, pdf.cursor], pdf.bounds.right, 60
pdf.fill_color "000000"
  pdf.move_down 10
  pdf.text "Serviços Realizados", size: 14, style: :bold, color: @secondary_color
  pdf.text "Descrição: Consulta Clínica   Profissional: Não Informado   Data: 08/02/2024   Valor: R$ 70,00", size: 12
  pdf.move_down 20

  # Totais com destaque
  pdf.text "Totalização:", size: 14, style: :bold, color: @secondary_color
  pdf.text "Valor Comanda: R$ 179,90", size: 12, style: :bold
  pdf.text "Desconto: R$ 10,00", size: 12
  pdf.text "Total a Pagar: R$ 169,90", size: 12
  pdf.text "Total Comanda: R$ 169,90", size: 12
  pdf.move_down 20

  # Informações adicionais no rodapé com estilo centralizado
  pdf.text "PARCEIRO VETUS CNPJ: 41.530.200/0001-33", size: 10, align: :center
  pdf.text "Rua Vicente Bettoni, 123 - Jardim Orly - CEP: 04434-230 São Paulo-SP"
end