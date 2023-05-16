Return-Path: <SRS0=fo6u=BF=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684232137; x=1686824137;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YWsELVTXfaxnW8c2mgYV3rVnMGPqE5qXQn5uShHFsM=;
        b=nfVVqAixUeO9zzGRbmFIOxZF5E06nH2vCK3tbmS738fXxSef2a8ZrzcfSxiCvh5Npc
         nBmjV/+H4EbGv3Kdgfs0+iWH6GTy7YesS96DcOmzk7nwYsP/1XiGRbkbKbNhwoUyN926
         qyt8i+U1AutsJyCK3K5WjIR8JbQPK9D+aiKKpDWscjfSIdUEGP0cIuiJw6QUP7fJTNIB
         pB3nHvDyjEsopk0+ARYBrjggW4ZRcvut0h/Ff4i2kDd9mH82bzkzvz+lDkWUJzJB2+Pg
         0OtSesd2D7oBq898EOMWcFIfp1N2i/EvmUk/fbMbh+4vKUvAft4rxMQZyxofGwpD+/33
         uydw==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <8c07d99a-cc0b-c277-4a09-d7072c70911d@gmail.com>
Date: Tue, 16 May 2023 18:15:31 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <B595FC9D-9EC6-401B-8181-D75C64E427CC@gmail.com>
References: <20230514145123.37079-1-mmpgouride@gmail.com>
 <8c07d99a-cc0b-c277-4a09-d7072c70911d@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

> 2023=E5=B9=B45=E6=9C=8816=E6=97=A5 =E4=B8=8B=E5=8D=886:07=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> On Sun, 14 May 2023 14:51:23 +0000, Alan Huang wrote:
>> The third step and the fourth step seem to have no causal =
relationship between them.
>=20
> Why do you expect causal relationship between the two?
>=20
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
>> 	execution.
>> \item	The counter corresponding to this reader will have been
>> 	at least 1 during this time interval.
>> -\item	The \co{synchronize_qrcu()} code forces at least one
>> -	of the counters to be at least 1 at all times.
>> +\item	If the counter corresponding to this reader is 1, then
>> +	the other counter is at least 1 because of the completion of
>> +	counter flip.
>> \item	Therefore, at any given point in time, either one of the
>> 	counters will be at least 2, or both of the counters will
>> 	be at least one.
>=20
> "Therefore" on item 4 looks to me assumes all of items 1, 2, and 3.

Yeah, that=E2=80=99s right. My commit message is misleading.

This patch makes item 3 more specific.

Thanks,
Alan

>=20
> What am I missing?
>=20
>        Thanks, Akira

