@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Saldos Iniciales Cta Nivel 5'
define view entity Z_SALDOS_INICIALES_AUX_N5 with parameters FechaInicial : datum
 as select from Z_SALDOS_INICIALES (FechaInicial : $parameters.FechaInicial ) as Saldos
{
  
 key left(Saldos.GLAccount,7) as GLAccount,
  sum(Saldos.Debito) as DebitoAux,
  sum(Saldos.Credito) as CreditoAux
  
}

where Saldos.PostingDate <= $parameters.FechaInicial

group by Saldos.GLAccount
