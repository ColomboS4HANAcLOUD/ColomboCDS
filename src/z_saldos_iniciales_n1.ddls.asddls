@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Suma Saldos Iniciales Cta Nivel 1'
define view entity Z_SALDOS_INICIALES_N1
 with parameters FechaInicial : datum
  as select from Z_SALDOS_INICIALES_AUX( FechaInicial: $parameters.FechaInicial ) as saldoniv1
{
    key saldoniv1.GLAccount,
    sum(saldoniv1.DebitoAux - (saldoniv1.CreditoAux * -1)) as SI_Niv1
}
group by saldoniv1.GLAccount
