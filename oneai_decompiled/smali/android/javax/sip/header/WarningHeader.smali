.class public interface abstract Landroid/javax/sip/header/WarningHeader;
.super Ljava/lang/Object;
.source "WarningHeader.java"

# interfaces
.implements Landroid/javax/sip/header/Header;


# static fields
.field public static final ATTRIBUTE_NOT_UNDERSTOOD:I = 0x132

.field public static final INCOMPATIBLE_BANDWIDTH_UNITS:I = 0x12f

.field public static final INCOMPATIBLE_MEDIA_FORMAT:I = 0x131

.field public static final INCOMPATIBLE_NETWORK_ADDRESS_FORMATS:I = 0x12d

.field public static final INCOMPATIBLE_NETWORK_PROTOCOL:I = 0x12c

.field public static final INCOMPATIBLE_TRANSPORT_PROTOCOL:I = 0x12e

.field public static final INSUFFICIENT_BANDWIDTH:I = 0x172

.field public static final MEDIA_TYPE_NOT_AVAILABLE:I = 0x130

.field public static final MISCELLANEOUS_WARNING:I = 0x18f

.field public static final MULTICAST_NOT_AVAILABLE:I = 0x14a

.field public static final NAME:Ljava/lang/String; = "Warning"

.field public static final SESSION_DESCRIPTION_PARAMETER_NOT_UNDERSTOOD:I = 0x133

.field public static final UNICAST_NOT_AVAILABLE:I = 0x14b


# virtual methods
.method public abstract getAgent()Ljava/lang/String;
.end method

.method public abstract getCode()I
.end method

.method public abstract getText()Ljava/lang/String;
.end method

.method public abstract setAgent(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method

.method public abstract setCode(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/javax/sip/InvalidArgumentException;
        }
    .end annotation
.end method

.method public abstract setText(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation
.end method
