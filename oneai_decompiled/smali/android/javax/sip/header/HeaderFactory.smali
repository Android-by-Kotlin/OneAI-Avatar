.class public interface abstract Landroid/javax/sip/header/HeaderFactory;
.super Ljava/lang/Object;
.source "HeaderFactory.java"


# virtual methods
.method public abstract createAcceptEncodingHeader(Ljava/lang/String;)Landroid/javax/sip/header/AcceptEncodingHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createAcceptHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/AcceptHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createAcceptLanguageHeader(Ljava/util/Locale;)Landroid/javax/sip/header/AcceptLanguageHeader;
.end method

.method public abstract createAlertInfoHeader(Landroid/javax/sip/address/URI;)Landroid/javax/sip/header/AlertInfoHeader;
.end method

.method public abstract createAllowEventsHeader(Ljava/lang/String;)Landroid/javax/sip/header/AllowEventsHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createAllowHeader(Ljava/lang/String;)Landroid/javax/sip/header/AllowHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createAuthenticationInfoHeader(Ljava/lang/String;)Landroid/javax/sip/header/AuthenticationInfoHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/AuthorizationHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createCSeqHeader(ILjava/lang/String;)Landroid/javax/sip/header/CSeqHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createCSeqHeader(JLjava/lang/String;)Landroid/javax/sip/header/CSeqHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createCallIdHeader(Ljava/lang/String;)Landroid/javax/sip/header/CallIdHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createCallInfoHeader(Landroid/javax/sip/address/URI;)Landroid/javax/sip/header/CallInfoHeader;
.end method

.method public abstract createContactHeader()Landroid/javax/sip/header/ContactHeader;
.end method

.method public abstract createContactHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/ContactHeader;
.end method

.method public abstract createContentDispositionHeader(Ljava/lang/String;)Landroid/javax/sip/header/ContentDispositionHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createContentEncodingHeader(Ljava/lang/String;)Landroid/javax/sip/header/ContentEncodingHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createContentLanguageHeader(Ljava/util/Locale;)Landroid/javax/sip/header/ContentLanguageHeader;
.end method

.method public abstract createContentLengthHeader(I)Landroid/javax/sip/header/ContentLengthHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createContentTypeHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/ContentTypeHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createDateHeader(Ljava/util/Calendar;)Landroid/javax/sip/header/DateHeader;
.end method

.method public abstract createErrorInfoHeader(Landroid/javax/sip/address/URI;)Landroid/javax/sip/header/ErrorInfoHeader;
.end method

.method public abstract createEventHeader(Ljava/lang/String;)Landroid/javax/sip/header/EventHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createExpiresHeader(I)Landroid/javax/sip/header/ExpiresHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createFromHeader(Landroid/javax/sip/address/Address;Ljava/lang/String;)Landroid/javax/sip/header/FromHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createHeader(Ljava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createHeaders(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createInReplyToHeader(Ljava/lang/String;)Landroid/javax/sip/header/InReplyToHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createMaxForwardsHeader(I)Landroid/javax/sip/header/MaxForwardsHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createMimeVersionHeader(II)Landroid/javax/sip/header/MimeVersionHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createMinExpiresHeader(I)Landroid/javax/sip/header/MinExpiresHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createOrganizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/OrganizationHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createPriorityHeader(Ljava/lang/String;)Landroid/javax/sip/header/PriorityHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createProxyAuthenticateHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyAuthenticateHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createProxyAuthorizationHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyAuthorizationHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createProxyRequireHeader(Ljava/lang/String;)Landroid/javax/sip/header/ProxyRequireHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRAckHeader(IILjava/lang/String;)Landroid/javax/sip/header/RAckHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRSeqHeader(I)Landroid/javax/sip/header/RSeqHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createReasonHeader(Ljava/lang/String;ILjava/lang/String;)Landroid/javax/sip/header/ReasonHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRecordRouteHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/RecordRouteHeader;
.end method

.method public abstract createReferToHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/ReferToHeader;
.end method

.method public abstract createReplyToHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/ReplyToHeader;
.end method

.method public abstract createRequireHeader(Ljava/lang/String;)Landroid/javax/sip/header/RequireHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createRetryAfterHeader(I)Landroid/javax/sip/header/RetryAfterHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createRouteHeader(Landroid/javax/sip/address/Address;)Landroid/javax/sip/header/RouteHeader;
.end method

.method public abstract createSIPETagHeader(Ljava/lang/String;)Landroid/javax/sip/header/SIPETagHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createSIPIfMatchHeader(Ljava/lang/String;)Landroid/javax/sip/header/SIPIfMatchHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createServerHeader(Ljava/util/List;)Landroid/javax/sip/header/ServerHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createSubjectHeader(Ljava/lang/String;)Landroid/javax/sip/header/SubjectHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createSubscriptionStateHeader(Ljava/lang/String;)Landroid/javax/sip/header/SubscriptionStateHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createSupportedHeader(Ljava/lang/String;)Landroid/javax/sip/header/SupportedHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createTimeStampHeader(F)Landroid/javax/sip/header/TimeStampHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createToHeader(Landroid/javax/sip/address/Address;Ljava/lang/String;)Landroid/javax/sip/header/ToHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createUnsupportedHeader(Ljava/lang/String;)Landroid/javax/sip/header/UnsupportedHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createUserAgentHeader(Ljava/util/List;)Landroid/javax/sip/header/UserAgentHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createViaHeader(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Landroid/javax/sip/header/ViaHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;,
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract createWWWAuthenticateHeader(Ljava/lang/String;)Landroid/javax/sip/header/WWWAuthenticateHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract createWarningHeader(Ljava/lang/String;ILjava/lang/String;)Landroid/javax/sip/header/WarningHeader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;,
            Ljava/text/ParseException;
        }
    .end annotation
.end method
