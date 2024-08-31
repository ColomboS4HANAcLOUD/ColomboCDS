@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Debitos y Creditos por Cta Nivel 7'
define view entity Z_DEBITOS_CREDITOS_AUX_N7 with parameters
    FechaInicial : datum,
    FechaFinal   : datum
  as select from Z_BALANCE_TERCEROS_HBT (FechaInicio : $parameters.FechaInicial , FechaFin : $parameters.FechaFinal) as Sumatoria
{
  key left(Sumatoria.GLAccount,9) as GLAccount,
  sum(Sumatoria.Debito)       as DebitoAux,
  sum(Sumatoria.Credito)      as CreditoAux,
  Sumatoria.AccountingDocument,
  Sumatoria.CompanyCode,
  Sumatoria.FiscalYear,
  Sumatoria.LedgerGLLineItem,
  Sumatoria.AccountingDocumentType,
  Sumatoria.PostingDate,
  Sumatoria.FiscalPeriod,
  Sumatoria.TransactionCurrency,
  Sumatoria.ReferenceDocumentType,
  Sumatoria.OriginalReferenceDocument,
  Sumatoria.Debito,
  Sumatoria.Credito,
  Sumatoria.Ref1,
  Sumatoria.Ref2,
  Sumatoria.Ref3,
  Sumatoria.AssignmentReference,
  Sumatoria.Centro,
  Sumatoria.ProfitCenter,
  Sumatoria.PartnerProfitCenter,
  Sumatoria.PartnerSegment,
  Sumatoria.CostCenter,
  Sumatoria.TaxCode,
  Sumatoria.ReferenceDocumentItem,
  Sumatoria.DocumentItemText,
  Sumatoria.AccountAssignment,
  --Sumatoria.YY1_HBTTercero_COB,
  Sumatoria.YY1_HBT_Tercero_S4_COB,
  --Sumatoria.YY1_HBT_Tercero_JEI,
  Sumatoria.AccountingDocumentItem

}
where
      Sumatoria.PostingDate >= $parameters.FechaInicial
  and Sumatoria.PostingDate <= $parameters.FechaFinal

group by
  Sumatoria.GLAccount,
  Sumatoria.AccountingDocument,
  Sumatoria.CompanyCode,
  Sumatoria.FiscalYear,
  Sumatoria.LedgerGLLineItem,
  Sumatoria.AccountingDocumentType,
  Sumatoria.PostingDate,
  Sumatoria.FiscalPeriod,
  Sumatoria.TransactionCurrency,
  Sumatoria.ReferenceDocumentType,
  Sumatoria.OriginalReferenceDocument,
  Sumatoria.Debito,
  Sumatoria.Credito,
  Sumatoria.Ref1,
  Sumatoria.Ref2,
  Sumatoria.Ref3,
  Sumatoria.AssignmentReference,
  Sumatoria.Centro,
  Sumatoria.ProfitCenter,
  Sumatoria.PartnerProfitCenter,
  Sumatoria.PartnerSegment,
  Sumatoria.CostCenter,
  Sumatoria.TaxCode,
  Sumatoria.ReferenceDocumentItem,
  Sumatoria.DocumentItemText,
  Sumatoria.AccountAssignment,
  ---Sumatoria.YY1_HBTTercero_COB,
  Sumatoria.YY1_HBT_Tercero_S4_COB,
  ---Sumatoria.YY1_HBT_Tercero_JEI,
  Sumatoria.AccountingDocumentItem
