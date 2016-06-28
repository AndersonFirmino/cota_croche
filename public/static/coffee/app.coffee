######################################
#
# Program CoffeeScript - Logica. 
#
######################################


class App
	@.init = ->
		iniciar_botoes()


	iniciar_botoes = ->
		calcular()
		pressionar_enter()
		mascarar_campo()

	
	mascarar_campo = ->
		$('#valor-por-ponto').maskMoney({
			symbol:'R$ ', 
			showSymbol:false, 
			thousands:'.', 
			decimal:'.', 
			symbolStay: false,
			alowZero: true
		})




	pegar_valor_por_ponto = ->
		pontos = $('#qtd-pontos').val()
		if pontos is ""
			$('#qtd-pontos').val(0)
			pontos = 0 		
			
		valor_por_ponto = $('#valor-por-ponto').val()
		if valor_por_ponto is "" 
			$('#valor-por-ponto').val(0.01)
			valor_por_ponto = 0.01
		
		
		return parseFloat(pontos) * parseFloat(valor_por_ponto)


	acrescimo_por_linha = ->
		porc_da_linha = $('#porcentagem-da-linha').val()
		if porc_da_linha is ""
			$('#porcentagem-da-linha').val(0)
			porc_da_linha = 0		
			
		return porc_da_linha


	acrescimo_por_enfeites = ->
		porcentagem_enfeites = $('#porcentagem-por-enfeites').val()
		if porcentagem_enfeites is ""
			$('#porcentagem-por-enfeites').val(0)
			porcentagem_enfeites = 0

		return porcentagem_enfeites


	calcular = ->
		$('#calcular').click ->			
			total_porcentagem = 0.0
			valor_por_ponto = pegar_valor_por_ponto()			
			acrs_por_linha = acrescimo_por_linha()
			acrs_por_enfeite = acrescimo_por_enfeites()			

			total_porcentagem += (acrs_por_linha + acrs_por_enfeite) / 100.00 * valor_por_ponto			

			total = valor_por_ponto + total_porcentagem

			total = total.toFixed(2)			
			$('#total').text total

	pressionar_enter = ->
		$(document).keypress (e) ->
			if e.which is 13
				$('#calcular').trigger("click")
				



(->
	$ ->
		App.init()
)(jQuery)