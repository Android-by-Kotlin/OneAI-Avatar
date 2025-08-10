.class public final Landroid/javax/sip/Timeout;
.super Ljava/lang/Object;
.source "Timeout.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final RETRANSMIT:Landroid/javax/sip/Timeout;

.field public static final TRANSACTION:Landroid/javax/sip/Timeout;

.field public static final _RETRANSMIT:I = 0x0

.field public static final _TRANSACTION:I = 0x1

.field private static m_size:I

.field private static m_timeoutArray:[Landroid/javax/sip/Timeout;


# instance fields
.field private m_timeout:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 185
    const/4 v0, 0x2

    sput v0, Landroid/javax/sip/Timeout;->m_size:I

    .line 186
    sget v0, Landroid/javax/sip/Timeout;->m_size:I

    new-array v0, v0, [Landroid/javax/sip/Timeout;

    sput-object v0, Landroid/javax/sip/Timeout;->m_timeoutArray:[Landroid/javax/sip/Timeout;

    .line 197
    new-instance v0, Landroid/javax/sip/Timeout;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/javax/sip/Timeout;-><init>(I)V

    sput-object v0, Landroid/javax/sip/Timeout;->RETRANSMIT:Landroid/javax/sip/Timeout;

    .line 209
    new-instance v0, Landroid/javax/sip/Timeout;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/javax/sip/Timeout;-><init>(I)V

    sput-object v0, Landroid/javax/sip/Timeout;->TRANSACTION:Landroid/javax/sip/Timeout;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 2
    .param p1, "timeout"    # I

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput p1, p0, Landroid/javax/sip/Timeout;->m_timeout:I

    .line 119
    sget-object v0, Landroid/javax/sip/Timeout;->m_timeoutArray:[Landroid/javax/sip/Timeout;

    iget v1, p0, Landroid/javax/sip/Timeout;->m_timeout:I

    aput-object p0, v0, v1

    .line 120
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .line 158
    sget-object v0, Landroid/javax/sip/Timeout;->m_timeoutArray:[Landroid/javax/sip/Timeout;

    iget v1, p0, Landroid/javax/sip/Timeout;->m_timeout:I

    aget-object v0, v0, v1

    return-object v0
.end method


# virtual methods
.method public getObject(I)Landroid/javax/sip/Timeout;
    .locals 2
    .param p1, "timeout"    # I

    .line 129
    if-ltz p1, :cond_0

    sget v0, Landroid/javax/sip/Timeout;->m_size:I

    if-ge p1, v0, :cond_0

    .line 130
    sget-object v0, Landroid/javax/sip/Timeout;->m_timeoutArray:[Landroid/javax/sip/Timeout;

    aget-object v0, v0, p1

    return-object v0

    .line 132
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid timeout value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getValue()I
    .locals 1

    .line 142
    iget v0, p0, Landroid/javax/sip/Timeout;->m_timeout:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 167
    const-string v0, ""

    .line 168
    .local v0, "text":Ljava/lang/String;
    iget v1, p0, Landroid/javax/sip/Timeout;->m_timeout:I

    packed-switch v1, :pswitch_data_0

    .line 177
    const-string v0, "Error while printing Timeout"

    goto :goto_0

    .line 174
    :pswitch_0
    const-string/jumbo v0, "Transaction Timeout"

    .line 175
    goto :goto_0

    .line 170
    :pswitch_1
    const-string/jumbo v0, "Retransmission Timeout"

    .line 171
    nop

    .line 180
    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
