.class public interface abstract Landroid/javax/sdp/SdpConstants;
.super Ljava/lang/Object;
.source "SdpConstants.java"


# static fields
.field public static final AVP_DEFINED_STATIC_MAX:I = 0x23

.field public static final AVP_DYNAMIC_MIN:I = -0x23

.field public static final CELB:I = 0x19

.field public static final CN:I = 0xd

.field public static final CN_DEPRECATED:I = 0x13

.field public static final DVI4_11025:I = 0x10

.field public static final DVI4_16000:I = 0x6

.field public static final DVI4_22050:I = 0x11

.field public static final DVI4_8000:I = 0x5

.field public static final DYNAMIC:Ljava/lang/String; = "-35"

.field public static final FMTP:Ljava/lang/String; = "FMTP"

.field public static final G722:I = 0x9

.field public static final G723:I = 0x4

.field public static final G726_32:I = 0x2

.field public static final G728:I = 0xf

.field public static final G729:I = 0x12

.field public static final GSM:I = 0x3

.field public static final H261:I = 0x1f

.field public static final H263:I = 0x22

.field public static final JPEG:I = 0x1a

.field public static final L16_1CH:I = 0xb

.field public static final L16_2CH:I = 0xa

.field public static final LPC:I = 0x7

.field public static final MP2T:I = 0x21

.field public static final MPA:I = 0xe

.field public static final MPV:I = 0x20

.field public static final NTP_CONST:J = 0x83aa7e80L

.field public static final NV:I = 0x1c

.field public static final PCMA:I = 0x8

.field public static final PCMU:I = 0x0

.field public static final QCELP:I = 0xc

.field public static final RESERVED:Ljava/lang/String; = "0"

.field public static final RTPMAP:Ljava/lang/String; = "rtpmap"

.field public static final RTP_AVP:Ljava/lang/String; = "RTP/AVP"

.field public static final TENSIXTEEN:I = 0x1

.field public static final UNASSIGNED:Ljava/lang/String; = "35"

.field public static final avpChannels:[I

.field public static final avpClockRates:[I

.field public static final avpTypeNames:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 181
    const/16 v0, 0x23

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "PCMU"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "1016"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "G721"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "GSM"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "G723"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "DVI4_8000"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "DVI4_16000"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "LPC"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string/jumbo v3, "PCMA"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "G722"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "L16_2CH"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "L16_1CH"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string/jumbo v3, "QCELP"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "CN"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "MPA"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "G728"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "DVI4_11025"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "DVI4_22050"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "G729"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "CN_DEPRECATED"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string/jumbo v3, "UNASSIGNED"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    aput-object v3, v1, v2

    const/16 v2, 0x16

    aput-object v3, v1, v2

    const/16 v2, 0x17

    aput-object v3, v1, v2

    const/16 v2, 0x18

    aput-object v3, v1, v2

    const/16 v2, 0x19

    const-string v4, "CelB"

    aput-object v4, v1, v2

    const/16 v2, 0x1a

    const-string v4, "JPEG"

    aput-object v4, v1, v2

    const/16 v2, 0x1b

    aput-object v3, v1, v2

    const/16 v2, 0x1c

    const-string/jumbo v4, "nv"

    aput-object v4, v1, v2

    const/16 v2, 0x1d

    aput-object v3, v1, v2

    const/16 v2, 0x1e

    aput-object v3, v1, v2

    const/16 v2, 0x1f

    const-string v3, "H261"

    aput-object v3, v1, v2

    const/16 v2, 0x20

    const-string v3, "MPV"

    aput-object v3, v1, v2

    const/16 v2, 0x21

    const-string v3, "MP2T"

    aput-object v3, v1, v2

    const-string v2, "H263"

    const/16 v3, 0x22

    aput-object v2, v1, v3

    sput-object v1, Landroid/javax/sdp/SdpConstants;->avpTypeNames:[Ljava/lang/String;

    .line 222
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Landroid/javax/sdp/SdpConstants;->avpClockRates:[I

    .line 261
    new-array v0, v3, [I

    fill-array-data v0, :array_1

    sput-object v0, Landroid/javax/sdp/SdpConstants;->avpChannels:[I

    return-void

    :array_0
    .array-data 4
        0x1f40
        0x1f40
        0x1f40
        0x1f40
        0x1f40
        0x1f40
        0x3e80
        0x1f40
        0x1f40
        0x1f40
        0xac44
        0xac44
        -0x1
        -0x1
        0x15f90
        0x1f40
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        0x15f90
        0x15f90
        -0x1
        0x15f90
        -0x1
        -0x1
        0x15f90
        0x15f90
        0x15f90
        -0x1
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x2
        0x1
        -0x1
        -0x1
        0x1
        0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data
.end method
