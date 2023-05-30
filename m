Return-Path: <SRS0=hS86=BT=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685460007; x=1688052007;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03qCOtfGEQ6fh7s0IELt1JYH34A7hCabDSTFL2vP6Ns=;
        b=GISZHfGi0ZaobX3qaTYSB2WttSw10pPo41fDqZbRly9LmhRjbkseGF4anAso0jzTWU
         SVFQoGQXc0+aCCfN5PrYvBgbBWa8g5DDh5PAqCFaEIypahs2s0bG2yahG0dwJkgVVYMs
         WwX2DLd0dXh05RK1BsgbRCkJTmYDNpNh8J2ZEtR6oIIPAlnlxmvYVxg9bDRiqR7gDgQb
         Op9No6Ua+p4MqbwO1eBkV4URBZmyk7FScuCIFXkoHmj5BTFqZG0aQGlFsp7F7BqiIjd5
         6uOMCx0Mg322Tgaf0e5mqLwAaRr5HGQ5lxHuOm3Tl94BVmdPkWEGh94sVlKQEWM4pd2r
         n8rA==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] together: Fix the description of state traversal
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <2821caa4-1212-41ee-b853-dc20e051113d@paulmck-laptop>
Date: Tue, 30 May 2023 23:19:51 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <F67611BA-639A-40C6-9EA4-031B50D8B184@gmail.com>
References: <20230528164020.15935-1-mmpgouride@gmail.com>
 <2821caa4-1212-41ee-b853-dc20e051113d@paulmck-laptop>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


> 2023=E5=B9=B45=E6=9C=8830=E6=97=A5 08:40=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sun, May 28, 2023 at 04:40:20PM +0000, Alan Huang wrote:
>> There seem to be some issues with the description of state =
transitions.
>> This patch fixes that.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> together/applyrcu.tex | 7 ++++---
>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
>> index 09a265f7..dee027b9 100644
>> --- a/together/applyrcu.tex
>> +++ b/together/applyrcu.tex
>> @@ -676,11 +676,12 @@ The normal path through this state machine =
traverses the states CLOSED,
>> OPEN, CLOSING (with an invocation of \co{call_rcu()}), and back to =
CLOSED
>> once the callback has been invoked.
>> If \co{open()} is invoked before the grace period completes, the
>> -state machine traverses the cycle OPEN, CLOSING (with an invocation
>> -of \co{call_rcu()}), and back to CLOSED once the callback has been =
invoked.
>> +state machine traverses the cycle OPEN, CLOSING (with
>> +an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once =
the
>> +callback has been invoked.
>> If \co{open()} and then \co{close()} are invoked before the grace =
period
>> completes, the state machine traverses the cycle OPEN, CLOSING (with
>> -an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once =
the
>> +an invocation of \co{call_rcu()}), REOPENING, RECLOSING, and back to =
CLOSING once the
>> callback has been invoked.
>=20
> I took this patch (thank you!), but wonder if we should describe the
> additional callback and additional transition to CLOSED, both here
> and below.  Thoughts?

That would be more accurate. But the transition to CLOSED has already =
been
described at the beginning of this paragraph. And omitting this =
description can
encourage readers to engage in critical thinking and draw their own =
conclusions.

But others may prefer more accurate explanations :)

So, both descriptions work for me.

Thanks,
Alan

>=20
> Thanx, Paul
>=20
>> Given an indefinite alternating sequence of \co{close()} and =
\co{open()}
>> --=20
>> 2.34.1
>>=20

