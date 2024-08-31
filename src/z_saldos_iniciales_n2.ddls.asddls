@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Suma Saldos Iniciales Cta Nivel 2'
define view entity Z_SALDOS_INICIALES_N2 with parameters FechaInicial : datum
  as select from Z_SALDOS_INICIALES_AUX_N2 ( FechaInicial: $parameters.FechaInicial ) as saldoniv2
{
   key saldoniv2.GLAccount,
    sum(saldoniv2.DebitoAux - (saldoniv2.CreditoAux * -1)) as SI_Niv2
}
group by saldoniv2.GLAccount
