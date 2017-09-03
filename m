Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:33086 "EHLO
 mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752984AbdICWag (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 3
 Sep 2017 18:30:36 -0400
Received: by mail-pf0-f176.google.com with SMTP id n73so13183987pfj.0 for
 <perfbook@vger.kernel.org>; Sun, 03 Sep 2017 15:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pH8+CbohE+nqyQ7zvOLiz0q1arvplb6tVSDTPkzKgYA=;
 b=Fyym/A87mN6AsimbAGEwHRyXxhLiCO1+UuQkYVTAQeULoiAZC6+gthm7LBSvEfaq60
 WB2UxX/xeJU7uchmoRfTEykevsecf89kfnPYVDkS5E5MgA0ZcGLE9Yd1X7p/NsJs4RYy
 Fhqzp6JRpTLZe87JlWKrS8RpVlqYiltEkoMQ5a0BSRdZ+RZkTxjmJCclk5Jb0SyyRCQO
 1p5WRDel94oJoh3+Yo04d1ykBQoep0OGmE6jNoIR35GwgB9lT2pHXOlM5AgOTJCsIkyh
 N6B804jB/kcqYQjkDHZQGc5kwJ5fzIjzLa0ZtKxx4s83uvot7l/b+9d2xYD5zSP0xi+D
 8DdA==
Subject: Re: [PATCH 0/2] Style guide updates
References: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
 <20170903173837.GE15437@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fc924fba-1dd2-dede-c557-2d42b7777fb0@gmail.com>
Date: Mon, 4 Sep 2017 07:30:32 +0900
In-Reply-To: <20170903173837.GE15437@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On 2017/09/04 2:38, Paul E. McKenney wrote:
> On Sun, Sep 03, 2017 at 11:54:19PM +0900, Akira Yokosawa wrote:
>> >From 91874614a21874550a5d9ffa3d0fba5f6d6416f1 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 3 Sep 2017 23:39:54 +0900
>> Subject: [PATCH 0/2] Style guide updates
>>
>> Hi Paul,
>>
>> This patch set adds a section of ellipsis and a couple of experimental
>> tables corresponding to new tables in memorder.
>> Booktabs' rules and gaps in mid-rules still works in these tables, I
>> suppose.
>>
>> Let me know what you think.
>=20
> Nice!  I have applied these.
>=20
> I played with Table D.13 (WWC) a bit, as the lightgray looked a bit
> heavy to me.  Using lightgray!25 was too light and made me strain a bit
> to see the grey line, but anywhere between lightgray!35 and lightgray!60
> looked fine.

lightgray is defined on line 930 in styleguide.tex at the moment.
Current definition is:

	\definecolor{lightgray}{gray}{0.9}

You can tweak it as you like. If you need more variation, you can define
another color and use it in specific tables.
But I'm against tweaking darkness in each table.

>=20
> The answer is probably "it depends" because my printer favors slightly
> darker than does my monitor.  Might depend on the table as well, as I
> would guess that the more empty cells the heavier the color needs to be.
> Left to myself, I would choose lightgray!50.  But what level of shading
> looks best to you on your equipment?

It definitely depends on the printer/display to use.
But as the definition of lightgray can be tuned as you like, I'm OK with
the default of, for example:

	\definecolor{lightgray}{gray}{0.95}

Let's see what people think.

The definition will be moved into perfbook.tex when we start conversion
of table layout and should be easy to find for people to customize.

      Thanks, Akira

> > Either way, it looks way better than the current pervasive use of \hline
> in the main body of the text for those particular tables.
>=20
> 							Thanx, Paul
>=20
>>     Thanks, Akira
>> --
>> Akira Yokosawa (2):
>>   styleguide: Add 'Ellipsis' section
>>   styleguide: Add more experimental tables
>>
>>  appendix/styleguide/styleguide.tex | 206 ++++++++++++++++++++++++++++++=
-------
>>  1 file changed, 169 insertions(+), 37 deletions(-)
>>
>> --=20
>> 2.7.4
>>
>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe perfbook" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3=
A__vger.kernel.org_majordomo-2Dinfo.html&d=3DDwICaQ&c=3Djf_iaSHvJObTbx-siA1=
ZOg&r=3Dux41CW3B5BSVxDMRNRWyLbUmPebZc70Kq4AkfdiRGMI&m=3DuyhL4QLWRXYTZychfv9=
5fU4Rb5i9T45Skiw-rOvTrSY&s=3DsHKlmz4HbWX3x0yqdKF5SarQcDgJHf8f3R9ZYQk2mm4&e=
=3D=20

