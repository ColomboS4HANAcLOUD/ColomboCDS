@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Debitos y Creditos por Cta Nivel 3'
define view entity Z_DEBITOS_CREDITOS_AUX_N3 with parameters  
 FechaInicial : datum,
 FechaFinal : datum
 as select from Z_DEBITOS_CREDITOS (FechaInicial : $parameters.FechaInicial , FechaFinal : $parameters.FechaFinal) as Sumatoria
{
 key left(Sumatoria.GLAccount,5) as GLAccount,
  sum(Sumatoria.Debito) as DebitoAux,
  sum(Sumatoria.Credito) as CreditoAux,
   Sumatoria.AccountingDocumentItem as Linea
  
}
where Sumatoria.PostingDate >= $parameters.FechaInicial 
and  Sumatoria.PostingDate <= $parameters.FechaFinal

group by  Sumatoria.GLAccount,Sumatoria.AccountingDocumentItem
