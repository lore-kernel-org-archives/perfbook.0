Return-Path: <SRS0=EXSE=BK=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684668975; x=1687260975;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96i2wUVJGhG2ReJNBbCpQ6bZZmVAv3FTsznyCrBrV7w=;
        b=DXh+hzpnznwrlvgA7oRPi5QTmyuqbQou3Yb1yZCMDExDhsC5Wx533vwaY+zFE5gvtG
         JQvOR4yQtzl1AHqbBnr5uUiLsH8GHO0ATTTjBr6LnNBq9udiWPQhAiLf+f5od9LlIxPM
         R2+tJvbyR0WhkawCgPQbMCec9mNKxlESYhON82A+RjVvRB261ZrexFcfIABPNgvtHt9p
         eomDQw/CzWaC9b1x8K4vQrsDV6WeerEYJXx02anEAx9+MEqbCJJGrhTaIgsB0ogEIr7d
         4TaOUlZ3Dpc+ihxyAWVRe6tifIL0G6AjttRdNCW38PqMHLyWsz3X18j/U5qyVWWEV3In
         ELgQ==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <779cf72a-ab43-4b52-96be-8cd02ced105e@paulmck-laptop>
Date: Sun, 21 May 2023 19:35:56 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <1FF6F171-B66C-47B0-91AB-36D4AF10F426@gmail.com>
References: <20230514145123.37079-1-mmpgouride@gmail.com>
 <779cf72a-ab43-4b52-96be-8cd02ced105e@paulmck-laptop>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


> 2023=E5=B9=B45=E6=9C=8821=E6=97=A5 18:20=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sun, May 14, 2023 at 02:51:23PM +0000, Alan Huang wrote:
>> The third step and the fourth step seem to have no causal =
relationship between them.
>> Therefore, this patch explains under what circumstances both counters =
will be at least 1.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> formal/spinhint.tex | 5 +++--
>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
>> index 16764aef..dd2e88cc 100644
>> --- a/formal/spinhint.tex
>> +++ b/formal/spinhint.tex
>> @@ -1103,8 +1103,9 @@ follows:
>> execution.
>> \item The counter corresponding to this reader will have been
>> at least 1 during this time interval.
>> -\item The \co{synchronize_qrcu()} code forces at least one
>> - of the counters to be at least 1 at all times.
>=20
> So this part is true and fundamental to understanding the code.  You =
can
> see this on lines 31-33 of Listing 12.14 ("QRCU Updater Process").
> This code increments the next counter before decrementing the previous
> counter.  I therefore don't see how we can reasonably delete this =
item.

Yes, this item is completely correct.

>=20
>> +\item If the counter corresponding to this reader is 1, then
>> + the other counter is at least 1 because of the completion of
>> + counter flip.
>=20
> However, we could potentially add this as an intermediate consequence
> of items 2 and 3.  Maybe something like this?
>=20
> \item The above two items imply that if the counter corresponding
> to this reader is exactly one, then the other counter must be
> greater than or equal to one.  Similarly, if the other counter
> is equal to zero, then the counter corresponding to the
> reader must be greater than or equal to two.

That will be very helpful, adding an item will be better than deleting =
one!

Thanks,
Alan

>=20
>> \item Therefore, at any given point in time, either one of the
>> counters will be at least 2, or both of the counters will
>> be at least one.
>=20
> Would that help, or am I missing your point?
>=20
> Thanx, Paul

