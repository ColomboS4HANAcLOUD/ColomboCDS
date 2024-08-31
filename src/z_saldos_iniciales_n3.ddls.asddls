@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Suma Saldos Iniciales Cta Nivel 3'
define view entity Z_SALDOS_INICIALES_N3 with parameters FechaInicial : datum
  as select from Z_SALDOS_INICIALES_AUX_N3 ( FechaInicial: $parameters.FechaInicial ) as saldoniv3
{
   key saldoniv3.GLAccount,
    sum(saldoniv3.DebitoAux - (saldoniv3.CreditoAux * -1)) as SI_Niv3
}
group by saldoniv3.GLAccount
