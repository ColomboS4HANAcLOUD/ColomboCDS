@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Suma Saldos Iniciales Cta Nivel 5'
define view entity Z_SALDOS_INICIALES_N5 with parameters FechaInicial : datum
  as select from Z_SALDOS_INICIALES_AUX_N5 ( FechaInicial: $parameters.FechaInicial ) as saldoniv5
{
  key saldoniv5.GLAccount,
    sum(saldoniv5.DebitoAux - (saldoniv5.CreditoAux * -1)) as SI_Niv5
}
group by saldoniv5.GLAccount
