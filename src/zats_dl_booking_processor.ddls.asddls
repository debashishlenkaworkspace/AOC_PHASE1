@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Of Booking Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZATS_DL_BOOKING_PROCESSOR as projection on ZATS_DL_BOOKING_M
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BOOKINGSTATUS,
    _BOOKSUPPL: redirected to composition child ZATS_DL_BOOKINGSUPPL_PROCESSOR,
    _Carrier,
    _Connection,
    _CUSTOMER,
    _Travel :redirected to parent ZATS_DL_TRAVEL_PROCESSOR
}
