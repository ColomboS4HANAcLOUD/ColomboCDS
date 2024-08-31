@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Suma Saldos Iniciales Cta Nivel 4'
define view entity Z_SALDOS_INICIALES_N4 with parameters FechaInicial : datum
  as select from Z_SALDOS_INICIALES_AUX_N4 ( FechaInicial: $parameters.FechaInicial ) as saldoniv4
{
   key  saldoniv4.GLAccount,
    sum(saldoniv4.DebitoAux - (saldoniv4.CreditoAux * -1)) as SI_Niv4
}
group by saldoniv4.GLAccount
