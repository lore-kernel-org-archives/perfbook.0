Return-Path: <SRS0=Uhyg=BG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684335362; x=1686927362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HyQTO4mvT4gmM3VQYNav8J8PacnXnv4J4CgpEKHbv1Q=;
        b=OGUL0ozzRV+AgyfsvDnRuuQUlqw6HXo6lyv7/bwRMSOsc38LcZsVjeyci3bZc/sk8m
         cVwT1esc/EOC08CivcX6wN1rZpwPJSVmucO2sEF4pQ2DjTdvjgy0uGzDFZKwf1oJ0BLq
         Z+cE4BIMPl5YG3/WjJ90BaJrylXMJKfofhkHsPYZtjKOnLaKk0QNH/YKyeShUY+wkX+S
         OsT3r1KrBld+wOEsqIXhCMR0TieZx2zB90Coj5F91D6/p4aIo3yLkk6ZFMQvoVKBDkjh
         igqxJOoosQ3lbWfGH3W8XbalkehoenX0Hurdc7Ue/vhtrgFhGX0xqIBeLJuVVVOdpUUN
         RAyQ==
Message-ID: <27a4aeaf-5eb4-fb15-4951-0fb200d4edd9@gmail.com>
Date: Wed, 17 May 2023 23:55:58 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
References: <20230514145123.37079-1-mmpgouride@gmail.com>
 <8c07d99a-cc0b-c277-4a09-d7072c70911d@gmail.com>
 <B595FC9D-9EC6-401B-8181-D75C64E427CC@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <B595FC9D-9EC6-401B-8181-D75C64E427CC@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Alan Huang <mmpgouride@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Tue, 16 May 2023 18:15:31 +0800, Alan Huang wrote:
> Hi Akira,
>=20
>> 2023=E5=B9=B45=E6=9C=8816=E6=97=A5 =E4=B8=8B=E5=8D=886:07=EF=BC=8CAkir=
a Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi Alan,
>>
>> On Sun, 14 May 2023 14:51:23 +0000, Alan Huang wrote:
>>> The third step and the fourth step seem to have no causal relationshi=
p between them.
>>
>> Why do you expect causal relationship between the two?
>>
>>> Therefore, this patch explains under what circumstances both counters=
 will be at least 1.
>>>
>>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>>> ---
>>> formal/spinhint.tex | 5 +++--
>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
>>> index 16764aef..dd2e88cc 100644
>>> --- a/formal/spinhint.tex
>>> +++ b/formal/spinhint.tex
>>> @@ -1103,8 +1103,9 @@ follows:
>>> 	execution.
>>> \item	The counter corresponding to this reader will have been
>>> 	at least 1 during this time interval.
>>> -\item	The \co{synchronize_qrcu()} code forces at least one
>>> -	of the counters to be at least 1 at all times.
>>> +\item	If the counter corresponding to this reader is 1, then
>>> +	the other counter is at least 1 because of the completion of
>>> +	counter flip.
>>> \item	Therefore, at any given point in time, either one of the
>>> 	counters will be at least 2, or both of the counters will
>>> 	be at least one.
>>
>> "Therefore" on item 4 looks to me assumes all of items 1, 2, and 3.
>=20
> Yeah, that=E2=80=99s right. My commit message is misleading.
>=20
> This patch makes item 3 more specific.

I might be too nit-picky, but you are changing the simple statement
of observation:

    The synchronize_qrcu() code forces at least one of the counters
    to be at least 1 at all times.

to a complex sentence of:

    If the counter corresponding to this reader is 1, then
    the other counter is at least 1 because of the completion of
    counter flip.

Your wording describes something different from the original one,
doesn't it?=20

Can you elaborate what you find hard to follow in this _informal_
proof?

        Thanks, Akira
>=20
> Thanks,
> Alan
>=20
>>
>> What am I missing?
>>
>>        Thanks, Akira
>=20
