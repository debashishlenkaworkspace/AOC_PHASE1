@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP BO Object - Booking Suppliment'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZATS_DL_BOOKSUPPL_M as select from /dmo/booksuppl_m 

association to parent ZATS_DL_BOOKING_M as _Booking on
$projection.BookingId = _Booking.BookingId and
$projection.TravelId  = _Booking.TravelId

association[1..1] to ZATS_DL_TRAVEL_M  as _Travel on
$projection.TravelId      = _Travel.TravelId

association[1..1] to /DMO/I_Supplement as _PRODUCT on
$projection.SupplementId = _PRODUCT.SupplementID

association[1..*] to /DMO/I_SupplementText as _SupplementText on
$projection.SupplementId = _SupplementText.SupplementID

{
key travel_id as TravelId,
key booking_id as BookingId,
key booking_supplement_id as BookingSupplementId,
supplement_id as SupplementId,
@Semantics.amount.currencyCode: 'CurrencyCode'
price as Price,
currency_code as CurrencyCode,
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at as LastChangedAt,

_Travel,
_PRODUCT,
_SupplementText,
_Booking

}
