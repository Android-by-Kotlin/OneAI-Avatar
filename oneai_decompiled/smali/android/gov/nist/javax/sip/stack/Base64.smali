.class public Landroid/gov/nist/javax/sip/stack/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;,
        Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final DECODE:I = 0x0

.field public static final DONT_GUNZIP:I = 0x4

.field public static final DO_BREAK_LINES:I = 0x8

.field public static final ENCODE:I = 0x1

.field private static final EQUALS_SIGN:B = 0x3dt

.field private static final EQUALS_SIGN_ENC:B = -0x1t

.field public static final GZIP:I = 0x2

.field private static final MAX_LINE_LENGTH:I = 0x4c

.field private static final NEW_LINE:B = 0xat

.field public static final NO_OPTIONS:I = 0x0

.field public static final ORDERED:I = 0x20

.field private static final PREFERRED_ENCODING:Ljava/lang/String; = "US-ASCII"

.field public static final URL_SAFE:I = 0x10

.field private static final WHITE_SPACE_ENC:B = -0x5t

.field private static final _ORDERED_ALPHABET:[B

.field private static final _ORDERED_DECODABET:[B

.field private static final _STANDARD_ALPHABET:[B

.field private static final _STANDARD_DECODABET:[B

.field private static final _URL_SAFE_ALPHABET:[B

.field private static final _URL_SAFE_DECODABET:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 150
    nop

    .line 222
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_STANDARD_ALPHABET:[B

    .line 240
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_STANDARD_DECODABET:[B

    .line 282
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_2

    sput-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_URL_SAFE_ALPHABET:[B

    .line 298
    const/16 v0, 0x100

    new-array v0, v0, [B

    fill-array-data v0, :array_3

    sput-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_URL_SAFE_DECODABET:[B

    .line 345
    const/16 v0, 0x40

    new-array v0, v0, [B

    fill-array-data v0, :array_4

    sput-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_ORDERED_ALPHABET:[B

    .line 363
    const/16 v0, 0x101

    new-array v0, v0, [B

    fill-array-data v0, :array_5

    sput-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_ORDERED_DECODABET:[B

    return-void

    :array_0
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2bt
        0x2ft
    .end array-data

    :array_1
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    :array_2
    .array-data 1
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x2dt
        0x5ft
    .end array-data

    :array_3
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3et
        -0x9t
        -0x9t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x3ft
        -0x9t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        0x25t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data

    :array_4
    .array-data 1
        0x2dt
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x41t
        0x42t
        0x43t
        0x44t
        0x45t
        0x46t
        0x47t
        0x48t
        0x49t
        0x4at
        0x4bt
        0x4ct
        0x4dt
        0x4et
        0x4ft
        0x50t
        0x51t
        0x52t
        0x53t
        0x54t
        0x55t
        0x56t
        0x57t
        0x58t
        0x59t
        0x5at
        0x5ft
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
        0x67t
        0x68t
        0x69t
        0x6at
        0x6bt
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x71t
        0x72t
        0x73t
        0x74t
        0x75t
        0x76t
        0x77t
        0x78t
        0x79t
        0x7at
    .end array-data

    :array_5
    .array-data 1
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x5t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x5t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x0t
        -0x9t
        -0x9t
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
        0x9t
        0xat
        -0x9t
        -0x9t
        -0x9t
        -0x1t
        -0x9t
        -0x9t
        -0x9t
        0xbt
        0xct
        0xdt
        0xet
        0xft
        0x10t
        0x11t
        0x12t
        0x13t
        0x14t
        0x15t
        0x16t
        0x17t
        0x18t
        0x19t
        0x1at
        0x1bt
        0x1ct
        0x1dt
        0x1et
        0x1ft
        0x20t
        0x21t
        0x22t
        0x23t
        0x24t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        0x25t
        -0x9t
        0x26t
        0x27t
        0x28t
        0x29t
        0x2at
        0x2bt
        0x2ct
        0x2dt
        0x2et
        0x2ft
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x3at
        0x3bt
        0x3ct
        0x3dt
        0x3et
        0x3ft
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
        -0x9t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 443
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(I)[B
    .locals 1
    .param p0, "x0"    # I

    .line 150
    invoke-static {p0}, Landroid/gov/nist/javax/sip/stack/Base64;->getDecodabet(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100([BII[BII)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # [B
    .param p4, "x4"    # I
    .param p5, "x5"    # I

    .line 150
    invoke-static/range {p0 .. p5}, Landroid/gov/nist/javax/sip/stack/Base64;->encode3to4([BII[BII)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200([BI[BII)I
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # I
    .param p2, "x2"    # [B
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .line 150
    invoke-static {p0, p1, p2, p3, p4}, Landroid/gov/nist/javax/sip/stack/Base64;->decode4to3([BI[BII)I

    move-result v0

    return v0
.end method

.method static synthetic access$300([B[BII)[B
    .locals 1
    .param p0, "x0"    # [B
    .param p1, "x1"    # [B
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .line 150
    invoke-static {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/Base64;->encode3to4([B[BII)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 1
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1224
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/gov/nist/javax/sip/stack/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/lang/String;I)[B
    .locals 10
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1242
    if-eqz p0, :cond_3

    .line 1248
    :try_start_0
    const-string/jumbo v0, "US-ASCII"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1252
    .local v0, "bytes":[B
    goto :goto_0

    .line 1250
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v0

    .line 1251
    .local v0, "uee":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    move-object v0, v1

    .line 1256
    .local v0, "bytes":[B
    :goto_0
    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, p1}, Landroid/gov/nist/javax/sip/stack/Base64;->decode([BIII)[B

    move-result-object v0

    .line 1260
    and-int/lit8 v1, p1, 0x4

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_1

    :cond_0
    move v1, v2

    .line 1261
    .local v1, "dontGunzip":Z
    :goto_1
    if-eqz v0, :cond_2

    array-length v4, v0

    const/4 v5, 0x4

    if-lt v4, v5, :cond_2

    if-nez v1, :cond_2

    .line 1263
    aget-byte v4, v0, v2

    and-int/lit16 v4, v4, 0xff

    aget-byte v3, v0, v3

    shl-int/lit8 v3, v3, 0x8

    const v5, 0xff00

    and-int/2addr v3, v5

    or-int/2addr v3, v4

    .line 1264
    .local v3, "head":I
    const v4, 0x8b1f

    if-ne v4, v3, :cond_2

    .line 1265
    const/4 v4, 0x0

    .line 1266
    .local v4, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v5, 0x0

    .line 1267
    .local v5, "gzis":Ljava/util/zip/GZIPInputStream;
    const/4 v6, 0x0

    .line 1268
    .local v6, "baos":Ljava/io/ByteArrayOutputStream;
    const/16 v7, 0x800

    new-array v7, v7, [B

    .line 1269
    .local v7, "buffer":[B
    const/4 v8, 0x0

    .line 1272
    .local v8, "length":I
    :try_start_1
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v6, v9

    .line 1273
    new-instance v9, Ljava/io/ByteArrayInputStream;

    invoke-direct {v9, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v4, v9

    .line 1274
    new-instance v9, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v9, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v5, v9

    .line 1276
    :goto_2
    invoke-virtual {v5, v7}, Ljava/util/zip/GZIPInputStream;->read([B)I

    move-result v9

    move v8, v9

    if-ltz v9, :cond_1

    .line 1277
    invoke-virtual {v6, v7, v2, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2

    .line 1281
    :cond_1
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v2

    .line 1289
    :try_start_2
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catch_1
    move-exception v2

    .line 1290
    :goto_3
    :try_start_3
    invoke-virtual {v5}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_4

    :catch_2
    move-exception v2

    .line 1291
    :goto_4
    :try_start_4
    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_b

    :catch_3
    move-exception v2

    .line 1292
    goto :goto_b

    .line 1289
    :catchall_0
    move-exception v2

    goto :goto_7

    .line 1284
    :catch_4
    move-exception v2

    .line 1285
    .local v2, "e":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1289
    .end local v2    # "e":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    goto :goto_5

    :catch_5
    move-exception v2

    .line 1290
    :goto_5
    :try_start_7
    invoke-virtual {v5}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_6

    :catch_6
    move-exception v2

    .line 1291
    :goto_6
    :try_start_8
    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_b

    .line 1289
    :goto_7
    :try_start_9
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_7

    goto :goto_8

    :catch_7
    move-exception v9

    .line 1290
    :goto_8
    :try_start_a
    invoke-virtual {v5}, Ljava/util/zip/GZIPInputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_8

    goto :goto_9

    :catch_8
    move-exception v9

    .line 1291
    :goto_9
    :try_start_b
    invoke-virtual {v4}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_9

    goto :goto_a

    :catch_9
    move-exception v9

    :goto_a
    throw v2

    .line 1297
    .end local v3    # "head":I
    .end local v4    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v5    # "gzis":Ljava/util/zip/GZIPInputStream;
    .end local v6    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "buffer":[B
    .end local v8    # "length":I
    :cond_2
    :goto_b
    return-object v0

    .line 1243
    .end local v0    # "bytes":[B
    .end local v1    # "dontGunzip":Z
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Input string was null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static decode([B)[B
    .locals 3
    .param p0, "source"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1120
    const/4 v0, 0x0

    .line 1122
    .local v0, "decoded":[B
    const/4 v1, 0x0

    array-length v2, p0

    invoke-static {p0, v1, v2, v1}, Landroid/gov/nist/javax/sip/stack/Base64;->decode([BIII)[B

    move-result-object v0

    .line 1126
    return-object v0
.end method

.method public static decode([BIII)[B
    .locals 11
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1152
    if-eqz p0, :cond_7

    .line 1155
    if-ltz p1, :cond_6

    add-int v0, p1, p2

    array-length v1, p0

    if-gt v0, v1, :cond_6

    .line 1160
    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 1161
    new-array v0, v0, [B

    return-object v0

    .line 1162
    :cond_0
    const/4 v1, 0x4

    if-lt p2, v1, :cond_5

    .line 1167
    invoke-static {p3}, Landroid/gov/nist/javax/sip/stack/Base64;->getDecodabet(I)[B

    move-result-object v2

    .line 1169
    .local v2, "DECODABET":[B
    mul-int/lit8 v3, p2, 0x3

    div-int/2addr v3, v1

    .line 1170
    .local v3, "len34":I
    new-array v4, v3, [B

    .line 1171
    .local v4, "outBuff":[B
    const/4 v5, 0x0

    .line 1173
    .local v5, "outBuffPosn":I
    new-array v1, v1, [B

    .line 1174
    .local v1, "b4":[B
    const/4 v6, 0x0

    .line 1175
    .local v6, "b4Posn":I
    const/4 v7, 0x0

    .line 1176
    .local v7, "i":I
    const/4 v8, 0x0

    .line 1178
    .local v8, "sbiDecode":B
    move v7, p1

    :goto_0
    add-int v9, p1, p2

    if-ge v7, v9, :cond_4

    .line 1180
    aget-byte v9, p0, v7

    and-int/lit16 v9, v9, 0xff

    aget-byte v8, v2, v9

    .line 1185
    const/4 v9, -0x5

    if-lt v8, v9, :cond_3

    .line 1186
    const/4 v9, -0x1

    if-lt v8, v9, :cond_2

    .line 1187
    add-int/lit8 v9, v6, 0x1

    .end local v6    # "b4Posn":I
    .local v9, "b4Posn":I
    aget-byte v10, p0, v7

    aput-byte v10, v1, v6

    .line 1188
    const/4 v6, 0x3

    if-le v9, v6, :cond_1

    .line 1189
    invoke-static {v1, v0, v4, v5, p3}, Landroid/gov/nist/javax/sip/stack/Base64;->decode4to3([BI[BII)I

    move-result v6

    add-int/2addr v5, v6

    .line 1190
    const/4 v6, 0x0

    .line 1193
    .end local v9    # "b4Posn":I
    .restart local v6    # "b4Posn":I
    aget-byte v9, p0, v7

    const/16 v10, 0x3d

    if-ne v9, v10, :cond_2

    .line 1194
    goto :goto_1

    .line 1188
    .end local v6    # "b4Posn":I
    .restart local v9    # "b4Posn":I
    :cond_1
    move v6, v9

    .line 1178
    .end local v9    # "b4Posn":I
    .restart local v6    # "b4Posn":I
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1201
    :cond_3
    new-instance v0, Ljava/io/IOException;

    aget-byte v9, p0, v7

    and-int/lit16 v9, v9, 0xff

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v9, v10}, [Ljava/lang/Object;

    move-result-object v9

    const-string v10, "Bad Base64 input character decimal %d in array position %d"

    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v0, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1206
    :cond_4
    :goto_1
    new-array v9, v5, [B

    .line 1207
    .local v9, "out":[B
    invoke-static {v4, v0, v9, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1208
    return-object v9

    .line 1163
    .end local v1    # "b4":[B
    .end local v2    # "DECODABET":[B
    .end local v3    # "len34":I
    .end local v4    # "outBuff":[B
    .end local v5    # "outBuffPosn":I
    .end local v6    # "b4Posn":I
    .end local v7    # "i":I
    .end local v8    # "sbiDecode":B
    .end local v9    # "out":[B
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Base64-encoded string must have at least four characters, but length specified was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1156
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    array-length v1, p0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "Source array with length %d cannot have offset of %d and process %d bytes."

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1153
    :cond_7
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Cannot decode null source array."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static decode4to3([BI[BII)I
    .locals 4
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "destination"    # [B
    .param p3, "destOffset"    # I
    .param p4, "options"    # I

    .line 1035
    if-eqz p0, :cond_5

    .line 1038
    if-eqz p2, :cond_4

    .line 1041
    if-ltz p1, :cond_3

    add-int/lit8 v0, p1, 0x3

    array-length v1, p0

    if-ge v0, v1, :cond_3

    .line 1045
    if-ltz p3, :cond_2

    add-int/lit8 v0, p3, 0x2

    array-length v1, p2

    if-ge v0, v1, :cond_2

    .line 1051
    invoke-static {p4}, Landroid/gov/nist/javax/sip/stack/Base64;->getDecodabet(I)[B

    move-result-object v0

    .line 1054
    .local v0, "DECODABET":[B
    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    const/16 v2, 0x3d

    if-ne v1, v2, :cond_0

    .line 1058
    aget-byte v1, p0, p1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    .line 1061
    .local v1, "outBuff":I
    ushr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 1062
    const/4 v2, 0x1

    return v2

    .line 1066
    .end local v1    # "outBuff":I
    :cond_0
    add-int/lit8 v1, p1, 0x3

    aget-byte v1, p0, v1

    if-ne v1, v2, :cond_1

    .line 1071
    aget-byte v1, p0, p1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v1, v2

    .line 1075
    .restart local v1    # "outBuff":I
    ushr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 1076
    add-int/lit8 v2, p3, 0x1

    ushr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 1077
    const/4 v2, 0x2

    return v2

    .line 1087
    .end local v1    # "outBuff":I
    :cond_1
    aget-byte v1, p0, p1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x12

    add-int/lit8 v2, p1, 0x1

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0xc

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x2

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x6

    or-int/2addr v1, v2

    add-int/lit8 v2, p1, 0x3

    aget-byte v2, p0, v2

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 1093
    .restart local v1    # "outBuff":I
    shr-int/lit8 v2, v1, 0x10

    int-to-byte v2, v2

    aput-byte v2, p2, p3

    .line 1094
    add-int/lit8 v2, p3, 0x1

    shr-int/lit8 v3, v1, 0x8

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 1095
    add-int/lit8 v2, p3, 0x2

    int-to-byte v3, v1

    aput-byte v3, p2, v2

    .line 1097
    const/4 v2, 0x3

    return v2

    .line 1046
    .end local v0    # "DECODABET":[B
    .end local v1    # "outBuff":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    array-length v1, p2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Destination array with length %d cannot have offset of %d and still store three bytes."

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1042
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    array-length v1, p0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    const-string/jumbo v2, "Source array with length %d cannot have offset of %d and still process four bytes."

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1039
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Destination array was null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1036
    :cond_5
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Source array was null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static decodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1612
    invoke-static {p0}, Landroid/gov/nist/javax/sip/stack/Base64;->decodeFromFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 1613
    .local v0, "decoded":[B
    const/4 v1, 0x0

    .line 1615
    .local v1, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v1, v2

    .line 1617
    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1623
    :try_start_1
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1624
    goto :goto_0

    :catch_0
    move-exception v2

    .line 1625
    nop

    .line 1626
    :goto_0
    return-void

    .line 1623
    :catchall_0
    move-exception v2

    goto :goto_1

    .line 1619
    :catch_1
    move-exception v2

    .line 1620
    .local v2, "e":Ljava/io/IOException;
    nop

    .end local v0    # "decoded":[B
    .end local v1    # "out":Ljava/io/OutputStream;
    .end local p0    # "infile":Ljava/lang/String;
    .end local p1    # "outfile":Ljava/lang/String;
    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1623
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "decoded":[B
    .restart local v1    # "out":Ljava/io/OutputStream;
    .restart local p0    # "infile":Ljava/lang/String;
    .restart local p1    # "outfile":Ljava/lang/String;
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 1624
    :goto_2
    goto :goto_3

    :catch_2
    move-exception v3

    goto :goto_2

    :goto_3
    throw v2
.end method

.method public static decodeFromFile(Ljava/lang/String;)[B
    .locals 10
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1478
    const/4 v0, 0x0

    .line 1479
    .local v0, "decodedData":[B
    const/4 v1, 0x0

    .line 1483
    .local v1, "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1484
    .local v2, "file":Ljava/io/File;
    const/4 v3, 0x0

    .line 1485
    .local v3, "buffer":[B
    const/4 v4, 0x0

    .line 1486
    .local v4, "length":I
    const/4 v5, 0x0

    .line 1489
    .local v5, "numBytes":I
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    const-wide/32 v8, 0x7fffffff

    cmp-long v6, v6, v8

    if-gtz v6, :cond_1

    .line 1493
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v6, v6

    new-array v6, v6, [B

    move-object v3, v6

    .line 1496
    new-instance v6, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;

    new-instance v7, Ljava/io/BufferedInputStream;

    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v8, 0x0

    invoke-direct {v6, v7, v8}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    move-object v1, v6

    .line 1501
    :goto_0
    const/16 v6, 0x1000

    invoke-virtual {v1, v3, v4, v6}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->read([BII)I

    move-result v6

    move v5, v6

    if-ltz v6, :cond_0

    .line 1502
    add-int/2addr v4, v5

    goto :goto_0

    .line 1506
    :cond_0
    new-array v6, v4, [B

    move-object v0, v6

    .line 1507
    invoke-static {v3, v8, v0, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1514
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "buffer":[B
    .end local v4    # "length":I
    .end local v5    # "numBytes":I
    :try_start_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 1515
    nop

    .line 1517
    :goto_1
    return-object v0

    .line 1491
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "buffer":[B
    .restart local v4    # "length":I
    .restart local v5    # "numBytes":I
    :cond_1
    :try_start_2
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "File is too big for this convenience method ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " bytes)."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "decodedData":[B
    .end local v1    # "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    .end local p0    # "filename":Ljava/lang/String;
    throw v6
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1514
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "buffer":[B
    .end local v4    # "length":I
    .end local v5    # "numBytes":I
    .restart local v0    # "decodedData":[B
    .restart local v1    # "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    .restart local p0    # "filename":Ljava/lang/String;
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 1510
    :catch_1
    move-exception v2

    .line 1511
    .local v2, "e":Ljava/io/IOException;
    nop

    .end local v0    # "decodedData":[B
    .end local v1    # "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    .end local p0    # "filename":Ljava/lang/String;
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1514
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "decodedData":[B
    .restart local v1    # "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    .restart local p0    # "filename":Ljava/lang/String;
    :goto_2
    :try_start_4
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catch_2
    move-exception v3

    :goto_3
    throw v2
.end method

.method public static decodeToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "dataToDecode"    # Ljava/lang/String;
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1443
    const/4 v0, 0x0

    .line 1445
    .local v0, "bos":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v0, v1

    .line 1447
    const-string/jumbo v1, "US-ASCII"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1453
    :try_start_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 1454
    nop

    .line 1456
    :goto_0
    return-void

    .line 1453
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 1449
    :catch_1
    move-exception v1

    .line 1450
    .local v1, "e":Ljava/io/IOException;
    nop

    .end local v0    # "bos":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    .end local p0    # "dataToDecode":Ljava/lang/String;
    .end local p1    # "filename":Ljava/lang/String;
    :try_start_2
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1453
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "bos":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    .restart local p0    # "dataToDecode":Ljava/lang/String;
    .restart local p1    # "filename":Ljava/lang/String;
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    :catch_2
    move-exception v2

    :goto_2
    throw v1
.end method

.method public static decodeToObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p0, "encodedObject"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1316
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/gov/nist/javax/sip/stack/Base64;->decodeToObject(Ljava/lang/String;ILjava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static decodeToObject(Ljava/lang/String;ILjava/lang/ClassLoader;)Ljava/lang/Object;
    .locals 6
    .param p0, "encodedObject"    # Ljava/lang/String;
    .param p1, "options"    # I
    .param p2, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 1341
    invoke-static {p0, p1}, Landroid/gov/nist/javax/sip/stack/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    .line 1343
    .local v0, "objBytes":[B
    const/4 v1, 0x0

    .line 1344
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v2, 0x0

    .line 1345
    .local v2, "ois":Ljava/io/ObjectInputStream;
    const/4 v3, 0x0

    .line 1348
    .local v3, "obj":Ljava/lang/Object;
    :try_start_0
    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-direct {v4, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    move-object v1, v4

    .line 1351
    if-nez p2, :cond_0

    .line 1352
    new-instance v4, Ljava/io/ObjectInputStream;

    invoke-direct {v4, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v2, v4

    goto :goto_0

    .line 1358
    :cond_0
    new-instance v4, Landroid/gov/nist/javax/sip/stack/Base64$1;

    invoke-direct {v4, v1, p2}, Landroid/gov/nist/javax/sip/stack/Base64$1;-><init>(Ljava/io/InputStream;Ljava/lang/ClassLoader;)V

    move-object v2, v4

    .line 1372
    :goto_0
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v3, v4

    .line 1381
    :try_start_1
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    .line 1382
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception v4

    .line 1383
    nop

    .line 1385
    :goto_2
    return-object v3

    .line 1381
    :catchall_0
    move-exception v4

    goto :goto_3

    .line 1377
    :catch_2
    move-exception v4

    .line 1378
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    nop

    .end local v0    # "objBytes":[B
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .end local v3    # "obj":Ljava/lang/Object;
    .end local p0    # "encodedObject":Ljava/lang/String;
    .end local p1    # "options":I
    .end local p2    # "loader":Ljava/lang/ClassLoader;
    :try_start_3
    throw v4

    .line 1374
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "objBytes":[B
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "obj":Ljava/lang/Object;
    .restart local p0    # "encodedObject":Ljava/lang/String;
    .restart local p1    # "options":I
    .restart local p2    # "loader":Ljava/lang/ClassLoader;
    :catch_3
    move-exception v4

    .line 1375
    .local v4, "e":Ljava/io/IOException;
    nop

    .end local v0    # "objBytes":[B
    .end local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .end local v2    # "ois":Ljava/io/ObjectInputStream;
    .end local v3    # "obj":Ljava/lang/Object;
    .end local p0    # "encodedObject":Ljava/lang/String;
    .end local p1    # "options":I
    .end local p2    # "loader":Ljava/lang/ClassLoader;
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1381
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "objBytes":[B
    .restart local v1    # "bais":Ljava/io/ByteArrayInputStream;
    .restart local v2    # "ois":Ljava/io/ObjectInputStream;
    .restart local v3    # "obj":Ljava/lang/Object;
    .restart local p0    # "encodedObject":Ljava/lang/String;
    .restart local p1    # "options":I
    .restart local p2    # "loader":Ljava/lang/ClassLoader;
    :goto_3
    :try_start_4
    invoke-virtual {v1}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v5

    .line 1382
    :goto_4
    :try_start_5
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v5

    :goto_5
    throw v4
.end method

.method public static encode(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 5
    .param p0, "raw"    # Ljava/nio/ByteBuffer;
    .param p1, "encoded"    # Ljava/nio/ByteBuffer;

    .line 558
    const/4 v0, 0x3

    new-array v1, v0, [B

    .line 559
    .local v1, "raw3":[B
    const/4 v2, 0x4

    new-array v2, v2, [B

    .line 561
    .local v2, "enc4":[B
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 562
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 563
    .local v3, "rem":I
    const/4 v4, 0x0

    invoke-virtual {p0, v1, v4, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 564
    invoke-static {v2, v1, v3, v4}, Landroid/gov/nist/javax/sip/stack/Base64;->encode3to4([B[BII)[B

    .line 565
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 566
    .end local v3    # "rem":I
    goto :goto_0

    .line 567
    :cond_0
    return-void
.end method

.method public static encode(Ljava/nio/ByteBuffer;Ljava/nio/CharBuffer;)V
    .locals 7
    .param p0, "raw"    # Ljava/nio/ByteBuffer;
    .param p1, "encoded"    # Ljava/nio/CharBuffer;

    .line 582
    const/4 v0, 0x3

    new-array v1, v0, [B

    .line 583
    .local v1, "raw3":[B
    const/4 v2, 0x4

    new-array v3, v2, [B

    .line 585
    .local v3, "enc4":[B
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 586
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 587
    .local v4, "rem":I
    const/4 v5, 0x0

    invoke-virtual {p0, v1, v5, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 588
    invoke-static {v3, v1, v4, v5}, Landroid/gov/nist/javax/sip/stack/Base64;->encode3to4([B[BII)[B

    .line 589
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v2, :cond_0

    .line 590
    aget-byte v6, v3, v5

    and-int/lit16 v6, v6, 0xff

    int-to-char v6, v6

    invoke-virtual {p1, v6}, Ljava/nio/CharBuffer;->put(C)Ljava/nio/CharBuffer;

    .line 589
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 592
    .end local v4    # "rem":I
    .end local v5    # "i":I
    :cond_0
    goto :goto_0

    .line 593
    :cond_1
    return-void
.end method

.method private static encode3to4([BII[BII)[B
    .locals 5
    .param p0, "source"    # [B
    .param p1, "srcOffset"    # I
    .param p2, "numSigBytes"    # I
    .param p3, "destination"    # [B
    .param p4, "destOffset"    # I
    .param p5, "options"    # I

    .line 499
    invoke-static {p5}, Landroid/gov/nist/javax/sip/stack/Base64;->getAlphabet(I)[B

    move-result-object v0

    .line 512
    .local v0, "ALPHABET":[B
    const/4 v1, 0x0

    if-lez p2, :cond_0

    aget-byte v2, p0, p1

    shl-int/lit8 v2, v2, 0x18

    ushr-int/lit8 v2, v2, 0x8

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    const/4 v3, 0x1

    if-le p2, v3, :cond_1

    add-int/lit8 v3, p1, 0x1

    aget-byte v3, p0, v3

    shl-int/lit8 v3, v3, 0x18

    ushr-int/lit8 v3, v3, 0x10

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    or-int/2addr v2, v3

    const/4 v3, 0x2

    if-le p2, v3, :cond_2

    add-int/lit8 v1, p1, 0x2

    aget-byte v1, p0, v1

    shl-int/lit8 v1, v1, 0x18

    ushr-int/lit8 v1, v1, 0x18

    :cond_2
    or-int/2addr v1, v2

    .line 516
    .local v1, "inBuff":I
    const/16 v2, 0x3d

    packed-switch p2, :pswitch_data_0

    .line 540
    return-object p3

    .line 519
    :pswitch_0
    ushr-int/lit8 v2, v1, 0x12

    aget-byte v2, v0, v2

    aput-byte v2, p3, p4

    .line 520
    add-int/lit8 v2, p4, 0x1

    ushr-int/lit8 v3, v1, 0xc

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 521
    add-int/lit8 v2, p4, 0x2

    ushr-int/lit8 v3, v1, 0x6

    and-int/lit8 v3, v3, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 522
    add-int/lit8 v2, p4, 0x3

    and-int/lit8 v3, v1, 0x3f

    aget-byte v3, v0, v3

    aput-byte v3, p3, v2

    .line 523
    return-object p3

    .line 526
    :pswitch_1
    ushr-int/lit8 v3, v1, 0x12

    aget-byte v3, v0, v3

    aput-byte v3, p3, p4

    .line 527
    add-int/lit8 v3, p4, 0x1

    ushr-int/lit8 v4, v1, 0xc

    and-int/lit8 v4, v4, 0x3f

    aget-byte v4, v0, v4

    aput-byte v4, p3, v3

    .line 528
    add-int/lit8 v3, p4, 0x2

    ushr-int/lit8 v4, v1, 0x6

    and-int/lit8 v4, v4, 0x3f

    aget-byte v4, v0, v4

    aput-byte v4, p3, v3

    .line 529
    add-int/lit8 v3, p4, 0x3

    aput-byte v2, p3, v3

    .line 530
    return-object p3

    .line 533
    :pswitch_2
    ushr-int/lit8 v3, v1, 0x12

    aget-byte v3, v0, v3

    aput-byte v3, p3, p4

    .line 534
    add-int/lit8 v3, p4, 0x1

    ushr-int/lit8 v4, v1, 0xc

    and-int/lit8 v4, v4, 0x3f

    aget-byte v4, v0, v4

    aput-byte v4, p3, v3

    .line 535
    add-int/lit8 v3, p4, 0x2

    aput-byte v2, p3, v3

    .line 536
    add-int/lit8 v3, p4, 0x3

    aput-byte v2, p3, v3

    .line 537
    return-object p3

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static encode3to4([B[BII)[B
    .locals 6
    .param p0, "b4"    # [B
    .param p1, "threeBytes"    # [B
    .param p2, "numSigBytes"    # I
    .param p3, "options"    # I

    .line 467
    const/4 v1, 0x0

    const/4 v4, 0x0

    move-object v0, p1

    move v2, p2

    move-object v3, p0

    move v5, p3

    invoke-static/range {v0 .. v5}, Landroid/gov/nist/javax/sip/stack/Base64;->encode3to4([BII[BII)[B

    .line 468
    return-object p0
.end method

.method public static encodeBytes([B)Ljava/lang/String;
    .locals 4
    .param p0, "source"    # [B

    .line 718
    const/4 v0, 0x0

    .line 720
    .local v0, "encoded":Ljava/lang/String;
    :try_start_0
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v1, v2}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 723
    nop

    .line 724
    if-eqz v0, :cond_0

    .line 725
    return-object v0

    .line 724
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 721
    :catch_0
    move-exception v1

    .line 722
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public static encodeBytes([BI)Ljava/lang/String;
    .locals 2
    .param p0, "source"    # [B
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 760
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, v0, v1, p1}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeBytes([BII)Ljava/lang/String;
    .locals 4
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I

    .line 786
    const/4 v0, 0x0

    .line 788
    .local v0, "encoded":Ljava/lang/String;
    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0, p1, p2, v1}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeBytes([BIII)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 791
    nop

    .line 792
    if-eqz v0, :cond_0

    .line 793
    return-object v0

    .line 792
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 789
    :catch_0
    move-exception v1

    .line 790
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public static encodeBytes([BIII)Ljava/lang/String;
    .locals 3
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 831
    invoke-static {p0, p1, p2, p3}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeBytesToBytes([BIII)[B

    move-result-object v0

    .line 835
    .local v0, "encoded":[B
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string/jumbo v2, "US-ASCII"

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 837
    :catch_0
    move-exception v1

    .line 838
    .local v1, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    return-object v2
.end method

.method public static encodeBytesToBytes([B)[B
    .locals 5
    .param p0, "source"    # [B

    .line 858
    const/4 v0, 0x0

    .line 860
    .local v0, "encoded":[B
    :try_start_0
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v1, v2}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeBytesToBytes([BIII)[B

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    .line 863
    nop

    .line 864
    return-object v0

    .line 861
    :catch_0
    move-exception v1

    .line 862
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/AssertionError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IOExceptions only come from GZipping, which is turned off: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public static encodeBytesToBytes([BIII)[B
    .locals 18
    .param p0, "source"    # [B
    .param p1, "off"    # I
    .param p2, "len"    # I
    .param p3, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 888
    move-object/from16 v7, p0

    move/from16 v8, p1

    move/from16 v9, p2

    if-eqz v7, :cond_b

    .line 892
    if-ltz v8, :cond_a

    .line 896
    if-ltz v9, :cond_9

    .line 900
    add-int v0, v8, v9

    array-length v1, v7

    if-gt v0, v1, :cond_8

    .line 908
    and-int/lit8 v0, p3, 0x2

    if-eqz v0, :cond_0

    .line 909
    const/4 v1, 0x0

    .line 910
    .local v1, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .line 911
    .local v2, "gzos":Ljava/util/zip/GZIPOutputStream;
    const/4 v3, 0x0

    .line 915
    .local v3, "b64os":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v1, v0

    .line 916
    new-instance v0, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;

    or-int/lit8 v4, p3, 0x1

    invoke-direct {v0, v1, v4}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v3, v0

    .line 917
    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v0, v3}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v2, v0

    .line 919
    invoke-virtual {v2, v7, v8, v9}, Ljava/util/zip/GZIPOutputStream;->write([BII)V

    .line 920
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 928
    :try_start_1
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 929
    :goto_0
    :try_start_2
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 930
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    :catch_2
    move-exception v0

    .line 931
    nop

    .line 933
    :goto_2
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    .line 928
    :catchall_0
    move-exception v0

    move-object v4, v0

    goto :goto_3

    .line 922
    :catch_3
    move-exception v0

    .line 925
    .local v0, "e":Ljava/io/IOException;
    nop

    .end local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .end local v3    # "b64os":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    .end local p0    # "source":[B
    .end local p1    # "off":I
    .end local p2    # "len":I
    .end local p3    # "options":I
    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 928
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v3    # "b64os":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    .restart local p0    # "source":[B
    .restart local p1    # "off":I
    .restart local p2    # "len":I
    .restart local p3    # "options":I
    :goto_3
    :try_start_5
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    .line 929
    :goto_4
    :try_start_6
    invoke-virtual {v3}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    goto :goto_5

    :catch_5
    move-exception v0

    .line 930
    :goto_5
    :try_start_7
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_6

    :catch_6
    move-exception v0

    :goto_6
    throw v4

    .line 938
    .end local v1    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .end local v3    # "b64os":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    :cond_0
    and-int/lit8 v0, p3, 0x8

    const/4 v10, 0x1

    if-eqz v0, :cond_1

    move v0, v10

    goto :goto_7

    :cond_1
    const/4 v0, 0x0

    .line 947
    .local v0, "breakLines":Z
    :goto_7
    div-int/lit8 v1, v9, 0x3

    const/4 v12, 0x4

    mul-int/2addr v1, v12

    rem-int/lit8 v2, v9, 0x3

    if-lez v2, :cond_2

    move v2, v12

    goto :goto_8

    :cond_2
    const/4 v2, 0x0

    :goto_8
    add-int/2addr v1, v2

    .line 948
    .local v1, "encLen":I
    if-eqz v0, :cond_3

    .line 949
    div-int/lit8 v2, v1, 0x4c

    add-int/2addr v1, v2

    move v13, v1

    goto :goto_9

    .line 948
    :cond_3
    move v13, v1

    .line 951
    .end local v1    # "encLen":I
    .local v13, "encLen":I
    :goto_9
    new-array v14, v13, [B

    .line 954
    .local v14, "outBuff":[B
    const/4 v1, 0x0

    .line 955
    .local v1, "d":I
    const/4 v2, 0x0

    .line 956
    .local v2, "e":I
    add-int/lit8 v15, v9, -0x2

    .line 957
    .local v15, "len2":I
    const/4 v3, 0x0

    move v6, v1

    move/from16 v16, v2

    move/from16 v17, v3

    .line 958
    .end local v1    # "d":I
    .end local v2    # "e":I
    .local v6, "d":I
    .local v16, "e":I
    .local v17, "lineLength":I
    :goto_a
    if-ge v6, v15, :cond_5

    .line 959
    add-int v2, v6, v8

    const/4 v3, 0x3

    move-object/from16 v1, p0

    move-object v4, v14

    move/from16 v5, v16

    move v11, v6

    .end local v6    # "d":I
    .local v11, "d":I
    move/from16 v6, p3

    invoke-static/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/Base64;->encode3to4([BII[BII)[B

    .line 961
    add-int/lit8 v1, v17, 0x4

    .line 962
    .end local v17    # "lineLength":I
    .local v1, "lineLength":I
    if-eqz v0, :cond_4

    const/16 v2, 0x4c

    if-lt v1, v2, :cond_4

    .line 964
    add-int/lit8 v2, v16, 0x4

    const/16 v3, 0xa

    aput-byte v3, v14, v2

    .line 965
    add-int/lit8 v16, v16, 0x1

    .line 966
    const/4 v1, 0x0

    move/from16 v17, v1

    goto :goto_b

    .line 958
    :cond_4
    move/from16 v17, v1

    .end local v1    # "lineLength":I
    .restart local v17    # "lineLength":I
    :goto_b
    add-int/lit8 v6, v11, 0x3

    .end local v11    # "d":I
    .restart local v6    # "d":I
    add-int/lit8 v16, v16, 0x4

    goto :goto_a

    .line 970
    :cond_5
    move v11, v6

    .end local v6    # "d":I
    .restart local v11    # "d":I
    if-ge v11, v9, :cond_6

    .line 971
    add-int v2, v11, v8

    sub-int v3, v9, v11

    move-object/from16 v1, p0

    move-object v4, v14

    move/from16 v5, v16

    move/from16 v6, p3

    invoke-static/range {v1 .. v6}, Landroid/gov/nist/javax/sip/stack/Base64;->encode3to4([BII[BII)[B

    .line 972
    add-int/lit8 v16, v16, 0x4

    move/from16 v1, v16

    goto :goto_c

    .line 970
    :cond_6
    move/from16 v1, v16

    .line 977
    .end local v16    # "e":I
    .local v1, "e":I
    :goto_c
    array-length v2, v14

    sub-int/2addr v2, v10

    if-gt v1, v2, :cond_7

    .line 982
    new-array v2, v1, [B

    .line 983
    .local v2, "finalOut":[B
    const/4 v3, 0x0

    invoke-static {v14, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 985
    return-object v2

    .line 988
    .end local v2    # "finalOut":[B
    :cond_7
    return-object v14

    .line 901
    .end local v0    # "breakLines":Z
    .end local v1    # "e":I
    .end local v11    # "d":I
    .end local v13    # "encLen":I
    .end local v14    # "outBuff":[B
    .end local v15    # "len2":I
    .end local v17    # "lineLength":I
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    array-length v3, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v1, v2, v3}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Cannot have offset of %d and length of %d with array of length %d"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 897
    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot have length offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 893
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot have negative offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 889
    :cond_b
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Cannot serialize a null array."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encodeFileToFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "infile"    # Ljava/lang/String;
    .param p1, "outfile"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1584
    invoke-static {p0}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeFromFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1585
    .local v0, "encoded":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1587
    .local v1, "out":Ljava/io/OutputStream;
    :try_start_0
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v1, v2

    .line 1589
    const-string/jumbo v2, "US-ASCII"

    invoke-virtual {v0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1595
    :try_start_1
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1596
    goto :goto_0

    :catch_0
    move-exception v2

    .line 1597
    nop

    .line 1598
    :goto_0
    return-void

    .line 1595
    :catchall_0
    move-exception v2

    goto :goto_1

    .line 1591
    :catch_1
    move-exception v2

    .line 1592
    .local v2, "e":Ljava/io/IOException;
    nop

    .end local v0    # "encoded":Ljava/lang/String;
    .end local v1    # "out":Ljava/io/OutputStream;
    .end local p0    # "infile":Ljava/lang/String;
    .end local p1    # "outfile":Ljava/lang/String;
    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1595
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "encoded":Ljava/lang/String;
    .restart local v1    # "out":Ljava/io/OutputStream;
    .restart local p0    # "infile":Ljava/lang/String;
    .restart local p1    # "outfile":Ljava/lang/String;
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 1596
    :goto_2
    goto :goto_3

    :catch_2
    move-exception v3

    goto :goto_2

    :goto_3
    throw v2
.end method

.method public static encodeFromFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1539
    const/4 v0, 0x0

    .line 1540
    .local v0, "encodedData":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1544
    .local v1, "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1545
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    long-to-double v3, v3

    const-wide v5, 0x3ff6666666666666L    # 1.4

    mul-double/2addr v3, v5

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    add-double/2addr v3, v5

    double-to-int v3, v3

    const/16 v4, 0x28

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-array v3, v3, [B

    .line 1546
    .local v3, "buffer":[B
    const/4 v4, 0x0

    .line 1547
    .local v4, "length":I
    const/4 v5, 0x0

    .line 1550
    .local v5, "numBytes":I
    new-instance v6, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;

    new-instance v7, Ljava/io/BufferedInputStream;

    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 v8, 0x1

    invoke-direct {v6, v7, v8}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    move-object v1, v6

    .line 1555
    :goto_0
    const/16 v6, 0x1000

    invoke-virtual {v1, v3, v4, v6}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->read([BII)I

    move-result v6

    move v5, v6

    if-ltz v6, :cond_0

    .line 1556
    add-int/2addr v4, v5

    goto :goto_0

    .line 1560
    :cond_0
    new-instance v6, Ljava/lang/String;

    const-string/jumbo v7, "US-ASCII"

    const/4 v8, 0x0

    invoke-direct {v6, v3, v8, v4, v7}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v6

    .line 1567
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "buffer":[B
    .end local v4    # "length":I
    .end local v5    # "numBytes":I
    :try_start_1
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 1568
    nop

    .line 1570
    :goto_1
    return-object v0

    .line 1567
    :catchall_0
    move-exception v2

    goto :goto_2

    .line 1563
    :catch_1
    move-exception v2

    .line 1564
    .local v2, "e":Ljava/io/IOException;
    nop

    .end local v0    # "encodedData":Ljava/lang/String;
    .end local v1    # "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    .end local p0    # "filename":Ljava/lang/String;
    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1567
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "encodedData":Ljava/lang/String;
    .restart local v1    # "bis":Landroid/gov/nist/javax/sip/stack/Base64$InputStream;
    .restart local p0    # "filename":Ljava/lang/String;
    :goto_2
    :try_start_3
    invoke-virtual {v1}, Landroid/gov/nist/javax/sip/stack/Base64$InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    :catch_2
    move-exception v3

    :goto_3
    throw v2
.end method

.method public static encodeObject(Ljava/io/Serializable;)Ljava/lang/String;
    .locals 1
    .param p0, "serializableObject"    # Ljava/io/Serializable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 618
    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/gov/nist/javax/sip/stack/Base64;->encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeObject(Ljava/io/Serializable;I)Ljava/lang/String;
    .locals 7
    .param p0, "serializableObject"    # Ljava/io/Serializable;
    .param p1, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 655
    if-eqz p0, :cond_1

    .line 660
    const/4 v0, 0x0

    .line 661
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 662
    .local v1, "b64os":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 663
    .local v2, "gzos":Ljava/util/zip/GZIPOutputStream;
    const/4 v3, 0x0

    .line 668
    .local v3, "oos":Ljava/io/ObjectOutputStream;
    :try_start_0
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v0, v4

    .line 669
    new-instance v4, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;

    or-int/lit8 v5, p1, 0x1

    invoke-direct {v4, v0, v5}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v1, v4

    .line 670
    and-int/lit8 v4, p1, 0x2

    if-eqz v4, :cond_0

    .line 672
    new-instance v4, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v4, v1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v2, v4

    .line 673
    new-instance v4, Ljava/io/ObjectOutputStream;

    invoke-direct {v4, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v3, v4

    goto :goto_0

    .line 676
    :cond_0
    new-instance v4, Ljava/io/ObjectOutputStream;

    invoke-direct {v4, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v3, v4

    .line 678
    :goto_0
    invoke-virtual {v3, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 686
    :try_start_1
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    .line 687
    :goto_1
    :try_start_2
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception v4

    .line 688
    :goto_2
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    :catch_2
    move-exception v4

    .line 689
    :goto_3
    :try_start_4
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_4

    :catch_3
    move-exception v4

    .line 690
    nop

    .line 694
    :goto_4
    :try_start_5
    new-instance v4, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    const-string/jumbo v6, "US-ASCII"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_5 .. :try_end_5} :catch_4

    return-object v4

    .line 696
    :catch_4
    move-exception v4

    .line 698
    .local v4, "uue":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    return-object v5

    .line 686
    .end local v4    # "uue":Ljava/io/UnsupportedEncodingException;
    :catchall_0
    move-exception v4

    goto :goto_5

    .line 680
    :catch_5
    move-exception v4

    .line 683
    .local v4, "e":Ljava/io/IOException;
    nop

    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .end local v3    # "oos":Ljava/io/ObjectOutputStream;
    .end local p0    # "serializableObject":Ljava/io/Serializable;
    .end local p1    # "options":I
    :try_start_6
    throw v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 686
    .end local v4    # "e":Ljava/io/IOException;
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "b64os":Ljava/io/OutputStream;
    .restart local v2    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .restart local v3    # "oos":Ljava/io/ObjectOutputStream;
    .restart local p0    # "serializableObject":Ljava/io/Serializable;
    .restart local p1    # "options":I
    :goto_5
    :try_start_7
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6

    goto :goto_6

    :catch_6
    move-exception v5

    .line 687
    :goto_6
    :try_start_8
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_7

    goto :goto_7

    :catch_7
    move-exception v5

    .line 688
    :goto_7
    :try_start_9
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_8

    goto :goto_8

    :catch_8
    move-exception v5

    .line 689
    :goto_8
    :try_start_a
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_9

    goto :goto_9

    :catch_9
    move-exception v5

    :goto_9
    throw v4

    .line 656
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "b64os":Ljava/io/OutputStream;
    .end local v2    # "gzos":Ljava/util/zip/GZIPOutputStream;
    .end local v3    # "oos":Ljava/io/ObjectOutputStream;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Cannot serialize a null object."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encodeToFile([BLjava/lang/String;)V
    .locals 4
    .param p0, "dataToEncode"    # [B
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1407
    if-eqz p0, :cond_0

    .line 1411
    const/4 v0, 0x0

    .line 1413
    .local v0, "bos":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    :try_start_0
    new-instance v1, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v0, v1

    .line 1415
    invoke-virtual {v0, p0}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1421
    :try_start_1
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 1422
    nop

    .line 1424
    :goto_0
    return-void

    .line 1421
    :catchall_0
    move-exception v1

    goto :goto_1

    .line 1417
    :catch_1
    move-exception v1

    .line 1418
    .local v1, "e":Ljava/io/IOException;
    nop

    .end local v0    # "bos":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    .end local p0    # "dataToEncode":[B
    .end local p1    # "filename":Ljava/lang/String;
    :try_start_2
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1421
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "bos":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    .restart local p0    # "dataToEncode":[B
    .restart local p1    # "filename":Ljava/lang/String;
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    :catch_2
    move-exception v2

    :goto_2
    throw v1

    .line 1408
    .end local v0    # "bos":Landroid/gov/nist/javax/sip/stack/Base64$OutputStream;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Data to encode was null."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static final getAlphabet(I)[B
    .locals 2
    .param p0, "options"    # I

    .line 413
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    .line 414
    sget-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_URL_SAFE_ALPHABET:[B

    return-object v0

    .line 415
    :cond_0
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_1

    .line 416
    sget-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_ORDERED_ALPHABET:[B

    return-object v0

    .line 418
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_STANDARD_ALPHABET:[B

    return-object v0
.end method

.method private static final getDecodabet(I)[B
    .locals 2
    .param p0, "options"    # I

    .line 431
    and-int/lit8 v0, p0, 0x10

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    .line 432
    sget-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_URL_SAFE_DECODABET:[B

    return-object v0

    .line 433
    :cond_0
    and-int/lit8 v0, p0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_1

    .line 434
    sget-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_ORDERED_DECODABET:[B

    return-object v0

    .line 436
    :cond_1
    sget-object v0, Landroid/gov/nist/javax/sip/stack/Base64;->_STANDARD_DECODABET:[B

    return-object v0
.end method
