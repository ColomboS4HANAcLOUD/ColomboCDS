@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Debitos y Creditos por Cta Nivel 6'
define view entity Z_DIARIO_NIVEL_6 --with parameters
    --FechaInicial : abap.char(8),
     --FechaFinal : abap.char(8)
  as select from I_JournalEntry     as EncabezadoAsiento
   inner join         I_JournalEntryItem as lineaAsiento on  EncabezadoAsiento.AccountingDocument = lineaAsiento.AccountingDocument
                                                    and EncabezadoAsiento.CompanyCode        = lineaAsiento.CompanyCode
                                                    and EncabezadoAsiento.FiscalYear         = lineaAsiento.FiscalYear
  --left outer join  Z_SALDOS_INICIALES_AUX (FechaInicial : $parameters.FechaInicial) as SaldosIniciales on lineaAsiento.GLAccount = SaldosIniciales.GLAccount
   
   
   /* left outer to one join         I_GLAccount        as cuenta       on cuenta.GLAccount = lineaAsiento.GLAccount*/
   /* join         I_User             as usuario      on usuario.UserID = EncabezadoAsiento.AccountingDocCreatedByUser*/
{

  key EncabezadoAsiento.AccountingDocument,
  key EncabezadoAsiento.CompanyCode,

  key EncabezadoAsiento.FiscalYear,
  key lineaAsiento.LedgerGLLineItem,


      EncabezadoAsiento.AccountingDocumentType,

      EncabezadoAsiento.PostingDate,

      EncabezadoAsiento.FiscalPeriod,


      EncabezadoAsiento.CreationTime,
      EncabezadoAsiento.AccountingDocCreatedByUser,
      EncabezadoAsiento.TransactionCode,
      EncabezadoAsiento.DocumentReferenceID,
      EncabezadoAsiento.TransactionCurrency,
      EncabezadoAsiento.BusinessTransactionType,
      EncabezadoAsiento.ReferenceDocumentType,
      EncabezadoAsiento.OriginalReferenceDocument,


      lineaAsiento.GLAccount,
     --SaldosIniciales.DebitoAux - SaldosIniciales.CreditoAux as SaldoInicial,
     
      case when lineaAsiento.DebitCreditCode = 'S' then sum(cast( lineaAsiento.AmountInTransactionCurrency as abap.dec(18,2) ) )
      else 0
      end as Debito,

      case when lineaAsiento.DebitCreditCode = 'H' then sum(cast( lineaAsiento.AmountInTransactionCurrency as abap.dec(18,2) ) )
      else 0
      end as Credito,
      
    

      sum(cast( lineaAsiento.AmountInTransactionCurrency as abap.dec(18,2) ) ) as Monto,

      lineaAsiento.DebitCreditCode,

      lineaAsiento.AssignmentReference,
      lineaAsiento.Plant,
      lineaAsiento.Product,
      lineaAsiento.AccountAssignmentType,
      lineaAsiento.ProfitCenter,
      lineaAsiento.PartnerProfitCenter,
      lineaAsiento.Segment,
      lineaAsiento.PartnerSegment,
      lineaAsiento.CostCenter,
      lineaAsiento.TaxCode,
      lineaAsiento.ReferenceDocumentItem,
      lineaAsiento.DocumentItemText,
      lineaAsiento.AccountAssignment,
       
      --lineaAsiento.YY1_HBTTercero_COB,
      lineaAsiento.YY1_HBT_Tercero_S4_COB,

      --lineaAsiento.YY1_HBT_Tercero_JEI,
      lineaAsiento.AccountingDocumentItem,
       lineaAsiento.Ledger
       



}
/*where EncabezadoAsiento.PostingDate between $parameters.FechaInicial and $parameters.FechaFinal*/
where  lineaAsiento.Ledger = '0L'
group by
  EncabezadoAsiento.AccountingDocument,
  EncabezadoAsiento.CompanyCode,
  lineaAsiento.LedgerGLLineItem,
  EncabezadoAsiento.FiscalYear,
  lineaAsiento.GLAccount,
  --lineaAsiento.YY1_HBT_Tercero_JEI,
  lineaAsiento.DebitCreditCode,

  EncabezadoAsiento.AccountingDocumentType,

  EncabezadoAsiento.PostingDate,

  EncabezadoAsiento.FiscalPeriod,


  EncabezadoAsiento.CreationTime,
  EncabezadoAsiento.AccountingDocCreatedByUser,
  EncabezadoAsiento.TransactionCode,
  EncabezadoAsiento.DocumentReferenceID,
  EncabezadoAsiento.TransactionCurrency,
  EncabezadoAsiento.BusinessTransactionType,
  EncabezadoAsiento.ReferenceDocumentType,
  EncabezadoAsiento.OriginalReferenceDocument,
  lineaAsiento.AssignmentReference,
  lineaAsiento.Plant,
  lineaAsiento.Product,
  lineaAsiento.AccountAssignmentType,
  lineaAsiento.ProfitCenter,
  lineaAsiento.PartnerProfitCenter,
  lineaAsiento.Segment,
  lineaAsiento.PartnerSegment,
  lineaAsiento.CostCenter,
  lineaAsiento.TaxCode,
  lineaAsiento.ReferenceDocumentItem,
  lineaAsiento.DocumentItemText,
  lineaAsiento.AccountAssignment,
  --lineaAsiento.YY1_HBTTercero_COB,
  lineaAsiento.YY1_HBT_Tercero_S4_COB,

  --lineaAsiento.YY1_HBT_Tercero_JEI,
  --SaldosIniciales.DebitoAux,
  --SaldosIniciales.CreditoAux,
    lineaAsiento.AccountingDocumentItem,
     lineaAsiento.Ledger
       
