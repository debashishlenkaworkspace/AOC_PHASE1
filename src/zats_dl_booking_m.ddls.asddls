@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP BO Object - Booking Details'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZATS_DL_BOOKING_M as select from /dmo/booking_m

composition[0..*] of ZATS_DL_BOOKSUPPL_M as _BOOKSUPPL

association to parent ZATS_DL_TRAVEL_M  as _Travel on
$projection.TravelId = _Travel.TravelId

association[1..1] to /DMO/I_Customer as _CUSTOMER on
$projection.CustomerId = _CUSTOMER.CustomerID

association[1..1] to /DMO/I_Carrier as _Carrier on
$projection.CarrierId  = _Carrier.AirlineID

association[1..1] to /DMO/I_Connection as _Connection on
$projection.ConnectionId = _Connection.ConnectionID

association[1..1] to /DMO/I_Booking_Status_VH as _BOOKINGSTATUS on
$projection.BookingStatus = _BOOKINGSTATUS.BookingStatus

{
key travel_id as TravelId,
key booking_id as BookingId,
booking_date as BookingDate,
customer_id as CustomerId,
carrier_id as CarrierId,
connection_id as ConnectionId,
flight_date as FlightDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
flight_price as FlightPrice,
currency_code as CurrencyCode,
booking_status as BookingStatus,
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at as LastChangedAt,

//Expose All Associations
   _CUSTOMER,
   _Carrier,
   _Connection,
   _BOOKINGSTATUS,
   _Travel,
   _BOOKSUPPL
}
