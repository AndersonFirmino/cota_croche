// Generated by CoffeeScript 1.10.0
var App;

App = (function() {
  var acrescimo_por_enfeites, acrescimo_por_linha, calcular, iniciar_botoes, mascarar_campo, pegar_valor_por_ponto, pressionar_enter;

  function App() {}

  App.init = function() {
    return iniciar_botoes();
  };

  iniciar_botoes = function() {
    calcular();
    pressionar_enter();
    return mascarar_campo();
  };

  mascarar_campo = function() {
    return $('#valor-por-ponto').maskMoney({
      symbol: 'R$ ',
      showSymbol: false,
      thousands: '.',
      decimal: '.',
      symbolStay: false,
      alowZero: true
    });
  };

  pegar_valor_por_ponto = function() {
    var pontos, valor_por_ponto;
    pontos = $('#qtd-pontos').val();
    if (pontos === "") {
      $('#qtd-pontos').val(0);
      pontos = 0;
    }
    valor_por_ponto = $('#valor-por-ponto').val();
    if (valor_por_ponto === "") {
      $('#valor-por-ponto').val(0.01);
      valor_por_ponto = 0.01;
    }
    return parseFloat(pontos) * parseFloat(valor_por_ponto);
  };

  acrescimo_por_linha = function() {
    var porc_da_linha;
    porc_da_linha = $('#porcentagem-da-linha').val();
    if (porc_da_linha === "") {
      $('#porcentagem-da-linha').val(0);
      porc_da_linha = 0;
    }
    return porc_da_linha;
  };

  acrescimo_por_enfeites = function() {
    var porcentagem_enfeites;
    porcentagem_enfeites = $('#porcentagem-por-enfeites').val();
    if (porcentagem_enfeites === "") {
      $('#porcentagem-por-enfeites').val(0);
      porcentagem_enfeites = 0;
    }
    return porcentagem_enfeites;
  };

  calcular = function() {
    return $('#calcular').click(function() {
      var acrs_por_enfeite, acrs_por_linha, total, total_porcentagem, valor_por_ponto;
      total_porcentagem = 0.0;
      valor_por_ponto = pegar_valor_por_ponto();
      acrs_por_linha = acrescimo_por_linha();
      acrs_por_enfeite = acrescimo_por_enfeites();
      total_porcentagem += (acrs_por_linha + acrs_por_enfeite) / 100.00 * valor_por_ponto;
      total = valor_por_ponto + total_porcentagem;
      total = total.toFixed(2);
      return $('#total').text(total);
    });
  };

  pressionar_enter = function() {
    return $(document).keypress(function(e) {
      if (e.which === 13) {
        return $('#calcular').trigger("click");
      }
    });
  };

  return App;

})();

(function() {
  return $(function() {
    return App.init();
  });
})(jQuery);
