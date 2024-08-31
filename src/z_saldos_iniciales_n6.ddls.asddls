@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Suma Saldos Iniciales Cta Nivel 6'
define view entity Z_SALDOS_INICIALES_N6 with parameters FechaInicial : datum
  as select from Z_SALDOS_INICIALES_AUX_N6 ( FechaInicial: $parameters.FechaInicial ) as saldoniv6
{
   key saldoniv6.GLAccount,
    sum(saldoniv6.DebitoAux - (saldoniv6.CreditoAux * -1)) as SI_Niv6
}
group by saldoniv6.GLAccount
