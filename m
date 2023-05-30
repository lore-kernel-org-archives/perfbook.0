Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjE3OxX (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 30 May 2023 10:53:23 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACDED9
        for <perfbook@vger.kernel.org>; Tue, 30 May 2023 07:53:22 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-53fb4ee9ba1so567258a12.3
        for <perfbook@vger.kernel.org>; Tue, 30 May 2023 07:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685458402; x=1688050402;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD/XUcZ4FAbM3/Xc6FzmzVtcymEskz3ile/bfagdpR8=;
        b=OPQIwxtrhQBxPCmxdd6VHFn4xDw876IPKOdQndg0bsCTzfLVJN+VEHMRbnKM1Ogc+L
         Qa+RqxaL0SOWyfPUg9LvQOsLCVHj2XaSpowo3q6u/EWyE7e59JLU1P9UI/ZQ1iXmcXnq
         GULfLlxT5+NZlrl6x9f64MP3RtooeqKx6QW4onDq8SGIWigYUreIs3OD1AW0eabkV8ed
         jRK7I1/HyGDb0tKUwTJhIO6N+dv+uPaGyYs9ZTCRucamI/X7xaZ1WQgaH8bXEOhEHcsZ
         FPcF1KPdmIKXp3JMNTXB/YbqEK2rVV9qeEV5c2p/NQy4AVubwdfv5XKIt2XPhmwemy+v
         6GlQ==
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH 1/2] CodeSample/count: Use plain access instead of
 WRITE_ONCE
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <7b569491-2591-4e0c-b334-a5ff1dbb2d7f@paulmck-laptop>
Date: Tue, 30 May 2023 22:53:04 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <66E25A10-3F79-4F07-A60E-5C1D71C9A7E1@gmail.com>
References: <20230528143729.15201-1-mmpgouride@gmail.com>
 <7b569491-2591-4e0c-b334-a5ff1dbb2d7f@paulmck-laptop>
List-ID: <perfbook.vger.kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org


> 2023=E5=B9=B45=E6=9C=8830=E6=97=A5 08:30=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sun, May 28, 2023 at 02:37:28PM +0000, Alan Huang wrote:
>> The cap here has not been published, plain access is enough.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>=20
> Good catch, thank you!
>=20
> Does line 27 of that same listing need a READ_ONCE(*ctrp)?

It does need! I have sent another patch.

Thanks,
Alan

>=20
> 							Thanx, Paul
>=20
>> ---
>> CodeSamples/count/count_end_rcu.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/CodeSamples/count/count_end_rcu.c =
b/CodeSamples/count/count_end_rcu.c
>> index 1171f0b6..8fc70611 100644
>> --- a/CodeSamples/count/count_end_rcu.c
>> +++ b/CodeSamples/count/count_end_rcu.c
>> @@ -89,7 +89,7 @@ void count_unregister_thread(int nthreadsexpected)	=
//\lnlbl{unreg:b}
>> 	}						=
//\lnlbl{unreg:alloc:e}
>> 	spin_lock(&final_mutex);			=
//\lnlbl{unreg:acq}
>> 	*cap =3D *countarrayp;				=
//\lnlbl{unreg:copy}
>> -	WRITE_ONCE(cap->total, cap->total + counter);	=
//\lnlbl{unreg:add}
>> +	cap->total +=3D counter;	//\lnlbl{unreg:add}
>> 	cap->counterp[idx] =3D NULL;			=
//\lnlbl{unreg:null}
>> 	capold =3D countarrayp;				=
//\lnlbl{unreg:retain}
>> 	rcu_assign_pointer(countarrayp, cap);		=
//\lnlbl{unreg:assign}
>> --=20
>> 2.34.1
>>=20

