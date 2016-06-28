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


	pegar_valor_por_ponto = ->
		pontos = $('#qtd-pontos').val()
		valor_por_ponto = $('#valor-por-ponto').val()
		return pontos * valor_por_ponto


	acrescimo_por_linha = ->
		porc_da_linha = $('#porcentagem-da-linha').val()
		return porc_da_linha


	acrescimo_por_enfeites = ->
		porcentagem_enfeites = $('#porcentagem-por-enfeites').val()
		return porcentagem_enfeites


	calcular = ->
		$('#calcular').click ->			
			total_porcentagem = 0.0
			valor_por_ponto = pegar_valor_por_ponto()			
			acrs_por_linha = parseFloat(acrescimo_por_linha())
			acrs_por_enfeite = parseFloat(acrescimo_por_enfeites())
			
			acrs_por_linha = 0 if acrs_por_linha is ""
			acrs_por_enfeite = 0 if acrs_por_enfeite is ""

			total_porcentagem += (acrs_por_linha + acrs_por_enfeite) / 100.00 * valor_por_ponto

			total = valor_por_ponto + total_porcentagem

			total = total.toFixed(2)			
			$('#total').text valor_por_ponto



(->
	$ ->
		App.init()
)(jQuery)