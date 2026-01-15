@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Of Booking Supplement Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZATS_DL_BOOKINGSUPPL_PROCESSOR
 as projection on ZATS_DL_BOOKSUPPL_M
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking :redirected to parent ZATS_DL_BOOKING_PROCESSOR,
    _PRODUCT,
    _SupplementText,
    _Travel : redirected to  ZATS_DL_TRAVEL_PROCESSOR
}
