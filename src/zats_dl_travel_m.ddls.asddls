@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP BO Object - Travel Details'
@Metadata.ignorePropagatedAnnotations: false
define root view entity ZATS_DL_TRAVEL_M as select from /dmo/travel_m

//Composition
composition[0..*] of ZATS_DL_BOOKING_M as _Booking

//Associations - 
association[0..1] to /DMO/I_Agency as _Agency on
$projection.AgencyId = _Agency.AgencyID
association[0..1] to /DMO/I_Customer as _CUSTOMER on
$projection.CustomerId = _CUSTOMER.CustomerID
association[0..1] to I_Currency as _CURRENCY on
$projection.CurrencyCode = _CURRENCY.Currency
association[1..1] to /DMO/I_Overall_Status_VH as _OVERALLSTATUS on
$projection.OverallStatus = _OVERALLSTATUS.OverallStatus


{
   key travel_id as TravelId,
   agency_id as AgencyId,
   customer_id as CustomerId,
   begin_date as BeginDate,
   end_date as EndDate,
//   @Semantics.amount.currencyCode: 'CurrencyCode'
   booking_fee as BookingFee,
//   @Semantics.amount.currencyCode: 'CurrencyCode'
   total_price as TotalPrice,
   currency_code as CurrencyCode,
   description as Description,
   overall_status as OverallStatus,
   @Semantics.user.createdBy: true
   created_by as CreatedBy,
   @Semantics.systemDateTime.createdAt: true
   created_at as CreatedAt,
   @Semantics.user.lastChangedBy: true
   last_changed_by as LastChangedBy,
   @Semantics.systemDateTime.lastChangedAt: true
   last_changed_at as LastChangedAt,
   
   case overall_status
   when 'O' then 'Open'
   when 'A' then 'Approved'
   when 'R' then 'Rejected'
   when 'X' then 'Cancelled'
   end as StatusText,
   
   case overall_status
   when 'O' then 2
   when 'A' then 3
   when 'R' then 0
   when 'X' then 0
   end as Criticality,
   
//   Expose Associations
    _Agency,
    _CUSTOMER,
    _CURRENCY,
    _OVERALLSTATUS,
    _Booking
}
